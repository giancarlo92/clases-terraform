resource "azurerm_resource_group" "rg01ej07" {
  for_each = toset(["rg-01", "rg-02", "rg-03", "rg-04", "rg-5"])
  name     = each.key
  location = "eastus2"
  tags = {
    "environment" = "Production"
    "creador"     = "Giancarlo Zevallos"
  }
}
