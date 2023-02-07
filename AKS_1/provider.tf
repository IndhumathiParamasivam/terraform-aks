# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "example-resources"
    storage_account_name = "mystorage3797"
    container_name       = "tfstate"
    key                  = "aks.tfstate"
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  # subscription_id = var.subscription_id
  # client_id       = var.client_id
  # client_secret   = var.client_secret
  # tenant_id       = var.tenant_id
  features {}
}