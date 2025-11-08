resource "azurerm_virtual_network" "demo" {
  name                = module.naming.service_name["virtual_network_name"]
  location            = var.location
  resource_group_name = module.rg.resource_group_name
  address_space       = var.vnet_address
  tags                = var.tags
}

# Single subnet creation
# resource "azurerm_subnet" "app" {
#   name                 = module.naming.service_name["subnet_name"]
#   resource_group_name  = module.naming.service_name["resource_group_name"]
#   virtual_network_name = azurerm_virtual_network.demo.name
#   address_prefixes     = [var.subnet_address]
# }


# Multiple subnet creation
resource "azurerm_subnet" "app" {
  for_each             = var.subnet_address
  name                 = "${module.naming.service_name["subnet_name"]}-${each.key}"
  resource_group_name  = module.rg.resource_group_name
  virtual_network_name = azurerm_virtual_network.demo.name
  address_prefixes     = [each.value]
}


# # Network Security Group\
