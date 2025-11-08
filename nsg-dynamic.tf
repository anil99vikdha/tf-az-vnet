
# NSG with dynamic block for security rules
resource "azurerm_network_security_group" "nsg_dynamic" {
  for_each = var.nsg_rules_map

  name                = "${module.naming.service_name["nsg_name"]}-${each.key}-nsg"
  location            = var.location
  resource_group_name = module.rg.resource_group_name

  dynamic "security_rule" {
    for_each = each.value
    content {
      name                       = security_rule.key
      priority                   = security_rule.value.priority
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = security_rule.value.port
      source_address_prefix      = lookup(security_rule.value, "source_ip", "*")
      destination_address_prefix = "*"
      description                = security_rule.value.description
    }
  }
}

resource "azurerm_subnet_network_security_group_association" "assoc_dynamic" {
  for_each = var.subnet_address

  subnet_id                 = azurerm_subnet.app[each.key].id
  network_security_group_id = azurerm_network_security_group.nsg_dynamic[each.key].id
}