output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}

output "public_subnet_name" {
  value = azurerm_subnet.public.name
}

output "private_subnet_name" {
  value = azurerm_subnet.private.name
}

output "endpoint_subnet_id" {
  value = azurerm_subnet.endpoint.id
}

output "public_nsga_id" {
  value = azurerm_subnet_network_security_group_association.public.id
}

output "private_nsga_id" {
  value = azurerm_subnet_network_security_group_association.private.id
}
  