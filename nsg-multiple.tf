# resource "azurerm_network_security_group" "nsg" {
#   for_each            = var.nsg_rules_map
#   name                = "${module.naming.service_name["nsg_name"]}-${each.key}-nsg"
#   location            = var.location
#   resource_group_name = module.rg.resource_group_name
# }

# resource "azurerm_network_security_rule" "nsg_rules" {
#   for_each = merge([
#     for subnet_name, rules in var.nsg_rules_map : {
#       for rule_name, rule in rules :
#       "${subnet_name}-${rule_name}" => {
#         subnet_name = subnet_name
#         rule_name   = rule_name
#         rule        = rule
#       }
#     }
#   ]...)

#   name                        = each.value.rule_name
#   priority                    = each.value.rule.priority
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = each.value.rule.port
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = module.rg.resource_group_name
#   network_security_group_name = azurerm_network_security_group.nsg[each.value.subnet_name].name
#   description                 = each.value.rule.description
# }

# resource "azurerm_subnet_network_security_group_association" "assoc" {
#   for_each = var.subnet_address

#   subnet_id                 = azurerm_subnet.app[each.key].id
#   network_security_group_id = azurerm_network_security_group.nsg[each.key].id
# }
