resource "azurerm_linux_virtual_machine" "devops_lab" {
  name                = "vm-devops-lab"
  resource_group_name = azurerm_resource_group.devops_lab.name
  location            = "Sweden Central"
  size                = "Standard_B2s_v2"

  admin_username = "azureuser"

  network_interface_ids = [
    azurerm_network_interface.devops_lab_sweden.id
  ]

  admin_ssh_key {
    username   = "azureuser"
    public_key = file("~/.ssh/id_ed25519.pub")
  }


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "ubuntu-24_04-lts"
    sku       = "server"
    version   = "latest"
  }
}
