terraform {
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "4.47.0"
      configuration_aliases = [azurerm.dnszone]
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}
provider "github" {
  token = var.gh_token
  owner = "hmcts"

}

