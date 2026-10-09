resource "azurerm_virtual_network" "devops_lab_sweden" {
  name                = "vnet-devops-lab-sweden"
  location            = "Sweden Central"
  resource_group_name = azurerm_resource_group.devops_lab.name
  address_space       = ["10.1.0.0/16"]
}

resource "azurerm_subnet" "devops_lab_sweden" {
  name                 = "subnet-devops-lab-sweden"
  resource_group_name  = azurerm_resource_group.devops_lab.name
  virtual_network_name = azurerm_virtual_network.devops_lab_sweden.name
  address_prefixes     = ["10.1.0.0/24"]
}

resource "azurerm_network_interface" "devops_lab_sweden" {
  name                = "nic-devops-lab-sweden"
  location            = "Sweden Central"
  resource_group_name = azurerm_resource_group.devops_lab.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.devops_lab_sweden.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.devops_lab.id
  }
}
