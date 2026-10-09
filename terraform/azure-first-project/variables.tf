variable "resource_group_name" {
  description = "Nombre del Resource Group"
  type        = string
  default     = "rg-devops-lab"
}

variable "location" {
  description = "Región del Resource Group"
  type        = string
  default     = "West Europe"
}

variable "vnet_location" {
  description = "Región de la Virtual Network"
  type        = string
  default     = "North Europe"
}

variable "ssh_public_key" {
  description = "SSH public key for the Azure Linux VM"
  type        = string
}
