variable "my_virtual_machine_password" {
  default     = "P@$$w0rd1234!"
  description = "Password of the Virtual Machine"
}

variable "my_virtual_machine_user" {
  default     = "adminuser"
  description = "User of the Virtual Machine"
}

variable "my_virtual_machine_size" {
  default     = "Standard_F2"
  description = "Size of the Virtual Machine"
}

variable "my_virtual_machine_name" {
  default     = "my-windows-vm"
  description = "Name of the Virtual Machine"
}