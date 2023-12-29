output "my_virtual_machine_name" {
  value = azurerm_windows_virtual_machine.example.name
}

output "my_virtual_machine_public_ip" {
  value = azurerm_windows_virtual_machine.example.public_ip_address
}
