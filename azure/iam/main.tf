terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.0.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "identity" {
  name     = "adam-identity-resource-group"
  location = "East US"
}

resource "azurerm_user_assigned_identity" "adam" {
  name                = "Adam"
  location            = azurerm_resource_group.identity.location
  resource_group_name = azurerm_resource_group.identity.name
}

output "principal_id" {
  value = azurerm_user_assigned_identity.adam.principal_id
}