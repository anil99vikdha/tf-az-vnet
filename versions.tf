terraform {
  required_version = ">=1.10.5" # Terraform version

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.45.0" # Provider version
    }
  }
}