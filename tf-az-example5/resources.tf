locals {
  rg_names =  concat(range(1, 5), range(6, 11))
}

resource "azurerm_resource_group" "rg01ej07" {
  for_each = toset([for v in local.rg_names : tostring(v)])
  name     = "production-${each.key}"
  location = "eastus2"
  tags = {
    "environment" = "Production"
    "creador"     = "Giancarlo Zevallos"
  }
}
