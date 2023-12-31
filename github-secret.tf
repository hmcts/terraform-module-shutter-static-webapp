data "github_repository" "repo" {
  full_name = "hmcts/azure-shutter-pages"
}

resource "github_actions_secret" "secret" {
  for_each        = { for frontend in var.shutter_apps : frontend.name => frontend }
  repository      = data.github_repository.repo.id
  secret_name     = join("_", [replace(each.value.name, "-", "_"), var.env])
  plaintext_value = azurerm_static_site.swebapp[each.key].api_key
}
