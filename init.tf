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
      version = "6.1.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias    = "dnszone"
  features {}
}

provider "github" {
  token = var.gh_token
  owner = "hmcts"
}
