resource_group_name = "apprggzl92"

location = "eastus2"
  
virtual_network = {
    name = "appvirtualnetgzl"
    address_space = "10.0.0.0/16"
}

virtual_subnet = {
    name           = "subnet1"
    address_prefix = "10.0.0.0/24"
}