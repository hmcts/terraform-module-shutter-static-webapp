terraform {
  required_version = "1.13.3"
  
  required_providers {
    azurerm = {
      source                = "hashicorp/azurerm"
      version               = ">= 3.65.0"
      configuration_aliases = [azurerm.dnszone]
    }
  }
}

provider "github" {
  alias   = "module"
  source  = "integrations/github"
  version = ">= 6.3.0"
  token   = var.gh_token
  owner   = "hmcts"
}
