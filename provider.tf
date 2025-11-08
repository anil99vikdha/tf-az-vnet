# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  # use_oidc = true
}

# terraform {
#   cloud {

#     organization = "traindevsecops"

#     workspaces {
#       name = "resourcegroup"
#     }
#   }
# }