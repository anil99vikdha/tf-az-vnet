# resource "azurerm_network_security_group" "app_nsg" {
#   name                = module.naming.service_name["nsg_name"]
#   location            = var.location
#   resource_group_name = module.naming.service_name["resource_group_name"]
#   tags                = var.tags
# }

# resource "azurerm_network_security_rule" "rules" {
#   for_each                    = var.nsg_rules
#   name                        = each.key
#   priority                    = each.value.priority
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = each.value.port
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = module.naming.service_name["resource_group_name"]
#   network_security_group_name = azurerm_network_security_group.app_nsg.name
#   description                 = each.value.description
# }

# resource "azurerm_subnet_network_security_group_association" "app_nsg_assoc" {
#   subnet_id                 = azurerm_subnet.app.id
#   network_security_group_id = azurerm_network_security_group.app_nsg.id
# }
