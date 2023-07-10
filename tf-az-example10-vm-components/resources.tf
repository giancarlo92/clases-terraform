resource "azurerm_resource_group" "apprggzl92" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    "environment" = "Production"
    "creador"     = "Giancarlo Zevallos"
  }
}

resource "azurerm_virtual_network" "appnetwork" {
  name                = var.virtual_network.name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = [var.virtual_network.address_space]  
  depends_on = [
    azurerm_resource_group.apprggzl92
  ]
}

resource "azurerm_subnet" "subnet1" {
  name                 = var.virtual_subnet.name
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network.name
  address_prefixes     = [var.virtual_subnet.address_prefix]
  depends_on = [
    azurerm_virtual_network.appnetwork
  ]
}

resource "azurerm_network_interface" "appinterface" {
  name                = "appinterface"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet1.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.appip.id
  }
  depends_on = [
    azurerm_subnet.subnet1
  ]
}

resource "azurerm_public_ip" "appip" {
  name                = "app-ip"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.apprggzl92
  ]
}

resource "azurerm_network_security_group" "appnsg" {
  name                = "app-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name

  security_rule {
    name                       = "AllowRDP"
    priority                   = 300
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  depends_on = [
    azurerm_resource_group.apprggzl92
  ]
}

resource "azurerm_subnet_network_security_group_association" "appnsglink" {
  subnet_id                 = azurerm_subnet.subnet1.id
  network_security_group_id = azurerm_network_security_group.appnsg.id
}

resource "azurerm_windows_virtual_machine" "vm-gzl" {
  name                = "vm-gzl"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_D2S_v3"
  admin_username      = "adminuser"
  admin_password      = "Passw0rd00"
  network_interface_ids = [
    azurerm_network_interface.appinterface.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  depends_on = [
    azurerm_network_interface.appinterface,
    azurerm_resource_group.apprggzl92
  ]
}