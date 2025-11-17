terraform {
  required_version = ">= 1.0"
  
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.65.0"
      configuration_aliases = [azurerm.dnszone]
    }
    github = {
      source  = "integrations/github"
      version = "5.45.0"
    }
  }
}
provider "github" {
  token = var.gh_token
  owner = "hmcts"

}

