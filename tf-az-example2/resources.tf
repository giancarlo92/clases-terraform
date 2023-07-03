resource "random_string" "rgname" {
  length  = 8
  special = false
}

resource "azurerm_resource_group" "rg01ej07" {
  name     = random_string.rgname.result
  location = "eastus2"
  tags = {
    "environment" = "Production"
    "creador"     = "Giancarlo Zevallos"
  }
}

resource "azurerm_storage_account" "sa01" {
  name                     = "stagalaxy27"
  resource_group_name      = azurerm_resource_group.rg01ej07.name
  location                 = azurerm_resource_group.rg01ej07.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "Production"
  }
}

resource "azurerm_storage_account" "sa02" {
  name                     = "stagalaxy27"
  resource_group_name      = azurerm_resource_group.rg01ej07.name
  location                 = azurerm_resource_group.rg01ej07.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  tags = {
    environment = "Production"
  }
  depends_on = [azurerm_storage_account.sa01]
}