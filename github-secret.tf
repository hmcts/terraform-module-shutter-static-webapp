data "github_repository" "repo" {
  full_name = "hmcts/azure-shutter-pages"
}

resource "github_actions_secret" "secret" {
  for_each        = { for frontend in var.shutter_apps : frontend.name => frontend }
  repository      = data.github_repository.repo.id
  secret_name     = each.value.name
  plaintext_value = azurerm_static_site.swebapp[each.key].api_key
}

output "github"{
    value = data.github_repository.repo.id
}