resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "germanywestcentral"
}

resource "azurerm_virtual_network" "v-net" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.v-net.name
  address_prefixes     = ["10.0.2.0/24"]
}

resource "azurerm_network_interface" "net-int" {
  name                = "example-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"

    public_ip_address_id = azurerm_public_ip.pub-id.id
  }
}
# Template Source: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/windows_virtual_machine

resource "azurerm_public_ip" "pub-id" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Dynamic"

  tags = {
    environment = "Production"
  }
  # Block Public IP Source: https://registry.terraform.io/providers/hashicorp/azurerm/2.55.0/docs/resources/public_ip
}

resource "azurerm_windows_virtual_machine" "example" {
  name                = var.my_virtual_machine_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  size                = var.my_virtual_machine_size
  admin_username      = var.my_virtual_machine_user
  admin_password      = var.my_virtual_machine_password
  network_interface_ids = [
    azurerm_network_interface.net-int.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}