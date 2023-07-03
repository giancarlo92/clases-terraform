resource "azurerm_resource_group" "apprggzl92" {
  name     = "apprggzl92"
  location = "centralus"
  tags = {
    "environment" = "Production"
    "creador"     = "Giancarlo Zevallos"
  }
}

resource "azurerm_storage_account" "appstoregzl92" {
  name     = "appstoregzl92"
  resource_group_name = azurerm_resource_group.apprggzl92.name 
  location = azurerm_resource_group.apprggzl92.location
  account_tier = "Standard"
  account_replication_type = "LRS"
  account_kind = "StorageV2"
}

resource "azurerm_storage_container" "data" {
  name = "data"
  storage_account_name = azurerm_storage_account.appstoregzl92.name
  container_access_type = "blob"
  
}

resource "azurerm_storage_blob" "maintf" {
  name                   = "azure-fundamentals.png"
  storage_account_name   = azurerm_storage_account.appstoregzl92.name
  storage_container_name = azurerm_storage_container.data.name
  type                   = "Block"
  source                 = "azure-fundamentals.png"
}