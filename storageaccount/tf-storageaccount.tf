terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}


resource "azurerm_resource_group" "example-resources" {
  name     = "example-resources"
  location = "East US"
}

resource "azurerm_storage_account" "tfstate" {
  name                     = "mystorage3797"
  resource_group_name      = azurerm_resource_group.example-resources.name
  location                 = azurerm_resource_group.example-resources.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  allow_blob_public_access = false

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}