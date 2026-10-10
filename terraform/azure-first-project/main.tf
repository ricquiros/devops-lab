terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate-devops"
    storage_account_name = "sttfstate1791614735"
    container_name       = "tfstate"
    key                  = "devops-lab.tfstate"
    use_azuread_auth     = true
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "devops_lab" {
  name     = var.resource_group_name
  location = var.location
}
