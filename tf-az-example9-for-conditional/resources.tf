# variable "storage_account_names" {
#   type    = list(string)
#   default = ["jackuksstr001", "jackuksstr002", "jackuksstr003"]
# }

# resource "azurerm_resource_group" "example" {
#   name     = "storage-rg"
#   location = "UK South"
# }

# resource "azurerm_storage_account" "my_storage" {
#   count                    = length(var.storage_account_names)
#   name                     = var.storage_account_names[count.index]
#   resource_group_name      = azurerm_resource_group.example.name
#   location                 = azurerm_resource_group.example.location
#   account_tier             = "Standard"
#   account_replication_type = "GRS"
# }

locals {
  # grs_storage_accounts = [for sa in azurerm_storage_account.my_storage: sa if sa.name != "jackuksstr001"]
  rg_names =  concat(range(1, 11))
}

# Comprehension list
resource "azurerm_resource_group" "rg01ej07" {
  for_each  = toset([for num in local.rg_names: "dev-${num}" if num < 5])
  name      = each.key
  location  = "eastus2"
}

# string inline
resource "azurerm_resource_group" "rg01ej09" {
  for_each  = toset(split(",", "%{for num in local.rg_names}%{if num >= 5}quality-${num}%{if num != length(local.rg_names)},%{endif}%{endif}%{endfor}"))
  name      = each.key
  location  = "eastus2"
}

# string template
resource "azurerm_resource_group" "rg01ej092" {
  for_each  = toset(split(",", trimspace(
    <<EOF
    %{~ for num in local.rg_names ~} 
      %{~ if num != 5 && num != 6 ~} production-${num} %{~ if num != length(local.rg_names) ~} , %{~ endif ~} %{~ endif ~} 
    %{~ endfor ~}
    EOF
  )))
  name      = each.key
  location  = "eastus2"
}


# output "test" {
#   value = local.rg_names
# }

# output "grs_storage_account_names" {
#   value = [for sa in local.grs_storage_accounts: sa.name]
# }

# output "grs_storage_account_names2" {
#   value = <<EOF
#   %{ for sa in azurerm_storage_account.my_storage }
#     %{ if sa.name != "jackuksstr001" }
#       ${sa.name}
#     %{ endif }
#   %{ endfor }
#   EOF
# }