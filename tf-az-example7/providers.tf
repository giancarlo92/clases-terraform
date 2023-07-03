terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.61.0"
    }
  }
}

provider "azurerm" {
  subscription_id = "87722fb1-502f-4196-9178-6b19035104ec"
  tenant_id = "970a6555-a9d5-4d1e-803e-5c48a67753ac"
  client_id = "94981667-0aa5-42e1-90cc-f5a51df71dd4"
  client_secret = "SkU8Q~YutLDiHRnrDZ2_0elpK8WP2eIcw59RQbue"
  features {}
}
