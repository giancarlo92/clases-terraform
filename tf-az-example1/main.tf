terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "bbbaefa4-dac7-485d-aaff-fb93543946c5"
}

resource "azurerm_resource_group" "rg01" {
  name     = "rg-gzl"
  location = "eastus2"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Giancarlo Zevallos"
  }
}

resource "azurerm_storage_account" "sa01" {
  name                     = "storagegzl"
  resource_group_name      = azurerm_resource_group.rg01.name
  location                 = azurerm_resource_group.rg01.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags = {
    Environment = "Dev"
    CreatedBy   = "Giancarlo Zevallos"
  }
}