output "vnet_id" {
  value       = azurerm_virtual_network.demo.id
  description = "ID of the virtual network"
}

output "subnet_ids" {
  description = "All subnet IDs"
  value = [for subnet in azurerm_subnet.app : subnet.id]
}