terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "eaef6598-e6cc-4bf3-b55e-769874019a77"
  features {}
}
