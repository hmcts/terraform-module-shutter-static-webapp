terraform {
  required_version = "1.14.0"
  
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = "4.53.0"
      configuration_aliases = [azurerm.dnszone]
    }
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
      # ">=6.8.2"  
    }
  }
}

provider "github" {
  token = var.gh_token
  owner = "hmcts"
 # alias = "module"

}

