locals {
  resource_group_name = "apprggzl92"
  location = "eastus2"
  number_of_virtualnetworks = 1
  //map variable
  virtual_network = {
    name = "appvirtualnetgzl"
    address_space = "10.0.0.0/16"
  }
  virtual_subnet = [
    {
      name           = "subnet1"
      address_prefix = "10.0.0.0/24"
    },
    {
      name           = "subnet2"
      address_prefix = "10.0.1.0/24"
    }
  ]
}

resource "azurerm_resource_group" "apprggzl92" {
  name     = local.resource_group_name
  location = local.location
  tags = {
    "environment" = "Production"
    "creador"     = "Giancarlo Zevallos"
  }
}

resource "azurerm_virtual_network" "appvirtualnetgzl" {
  name                = local.virtual_network.name
  location            = local.location
  resource_group_name = local.resource_group_name
  address_space       = [local.virtual_network.address_space]

  dynamic "subnet" {
    for_each = local.virtual_subnet
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
    }
  }
}