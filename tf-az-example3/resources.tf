resource "azurerm_resource_group" "rg01ej07" {
  count    = 5
  name     = "production-${count.index + 1}"
  location = "eastus2"
  tags = {
    "environment" = "Production"
    "creador"     = "Giancarlo Zevallos"
  }
}
