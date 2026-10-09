resource "azurerm_public_ip" "devops_lab" {
  name                = "pip-devops-lab"
  location            = "Sweden Central"
  resource_group_name = azurerm_resource_group.devops_lab.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_security_group" "devops_lab" {
  name                = "nsg-devops-lab"
  location            = "Sweden Central"
  resource_group_name = azurerm_resource_group.devops_lab.name

  security_rule {
    name                       = "Allow-Custom-Nginx"
    priority                   = 130
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8082"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "Allow-Docker-Nginx"
    priority                   = 120
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "8080"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow-SSH"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "79.116.221.19/32"
    destination_address_prefix = "*"
  }
  security_rule {
    name                       = "Allow-HTTP"
    priority                   = 110
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "devops_lab" {
  network_interface_id      = azurerm_network_interface.devops_lab_sweden.id
  network_security_group_id = azurerm_network_security_group.devops_lab.id
}
