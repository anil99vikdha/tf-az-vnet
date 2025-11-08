module "rg" {
  source              = "../tf-az-rg"
  resource_group_name = module.naming.service_name["resource_group_name"]
  location            = "West Europe"
}