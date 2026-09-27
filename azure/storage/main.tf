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

variable "storage_account_name" {
  description = "Globally unique, lowercase Azure Storage account name."
  type        = string
}

resource "azurerm_resource_group" "storage" {
  name     = "batch25-storage-resource-group"
  location = "East US"
}

resource "azurerm_storage_account" "bucket" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.storage.name
  location                 = azurerm_resource_group.storage.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "bucket" {
  name                  = "batch25terraformbucket"
  storage_account_name  = azurerm_storage_account.bucket.name
  container_access_type = "private"
}