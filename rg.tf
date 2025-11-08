module "rg" {
  source              = "app.terraform.io/traindevsecops/tf-az-rg/azure"
  version             = "1.2.0"
  resource_group_name = module.tf-az-naming-convention.service_name["resource_group_name"]
  location            = "West Europe"
}