
resource "azurerm_static_site" "swebapp" {
  for_each            = { for frontend in var.shutter_apps : frontend.name => frontend }
  name                = each.value.name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  sku_tier            = var.sku_tier
  sku_size            = var.sku_size
}

resource "azurerm_static_site_custom_domain" "custom_domain" {
  for_each        = { for frontend in var.shutter_apps : frontend.name => frontend }
  static_site_id  = azurerm_static_site.swebapp[each.key].id
  domain_name     = each.value.custom_domain
  validation_type =  "dns-txt-token"
}

resource "azurerm_dns_txt_record" "zone_validate" {
  for_each            = { for frontend in var.shutter_apps : frontend.name => frontend }
  provider            = azurerm.dnszone
  name                = each.value.custom_domain == each.value.dns_zone_name ? "_dnsauth" : join(".", ["_dnsauth", trimsuffix(trimsuffix(each.value.custom_domain, each.value.dns_zone_name), ".")])
  zone_name           = each.value.dns_zone_name
  resource_group_name = var.dns_zone_resource_group_name
  ttl                 = 300
  record {
    # ISSUE: https://github.com/hashicorp/terraform-provider-azurerm/issues/14750
    value = azurerm_static_site_custom_domain.custom_domain[each.key].validation_token == "" ? "validated" : azurerm_static_site_custom_domain.custom_domain[each.key].validation_token
  }
}

resource "azurerm_dns_cname_record" "cname_record" {
  for_each            = { for frontend in var.shutter_apps : frontend.name => frontend }
  provider            = azurerm.dnszone
  name                = each.value.custom_domain != each.value.dns_zone_name ? join("-", [trimsuffix(trimsuffix(each.value.custom_domain, each.value.dns_zone_name), "."), "shutter"]) :  join("-", [azurerm_static_site.swebapp[each.key].name, "shutter"])
  zone_name           = each.value.dns_zone_name
  resource_group_name = var.dns_zone_resource_group_name
  ttl                 = 300
  record              = azurerm_static_site.swebapp[each.key].default_host_name
}
