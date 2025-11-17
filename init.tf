terraform {
  required_version = "1.13.3"
  
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.65.0"
      configuration_aliases = [azurerm.dnszone]
    }
    github = {
      source  = "integrations/github"
    }
  }
}
provider "github" {
  token = var.gh_token
  owner = "hmcts"

}

