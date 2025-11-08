variable "location" {
  type        = string
  description = "Azure region"
  default     = "West Europe"
}


variable "vnet_address" {
  type        = list(string)
  description = "List of address spaces"
  default     = ["10.10.0.0/16"]
}

variable "tags" {
  description = "Tags to apply to the VNet"
  type        = map(string)
  default = {
    project     = "trainxops"
    environment = "Dev"
  }
}

# variable "subnet_address" {
#   description = "Subnet address range"
#   type        = string
#   default     = "10.10.1.0/24"
# }

variable "subnet_address" {
  description = "Subnet address range"
  type        = map(string)
  default     = {
    "frontend" = "10.10.1.0/24" # 80/443 ports open to internet
    "backend"  = "10.10.2.0/24"
    "database"  = "10.10.3.0/24"
    # "lb"       = "10.10.4.0/24"
    # "bastion"  = "10.10.5.0/24"
  }
}


# variable "nsg_rules" {
#   description = "NSG rules"
#   type = map(object({
#     priority    = number
#     port        = string
#     description = string
#   }))
#   default = {
#     "Allow-HTTP" = {
#       priority    = 100
#       port        = "80"
#       description = "Allow HTTP"
#     },
#     "Allow-HTTPS" = {
#       priority    = 110
#       port        = "443"
#       description = "Allow HTTPS"
#     }
#   }
# }

variable "nsg_rules_map" {
  description = "NSG rules per subnet"
  type = map(map(object({
    priority    = number
    port        = string
    description = string
    source_ip   = optional(string)
  })))
  default = {
    frontend = {
      "Allow-HTTP"  = { priority = 100, port = "80",  source_ip = "*", description = "Allow HTTP" }
      "Allow-HTTPS" = { priority = 110, port = "443", source_ip = "*", description = "Allow HTTPS" }
      "Allow-SSH"  = { priority = 111, port = "22",  source_ip = "49.37.163.205/32", description = "Allow SSH" }
    }
    backend = {
      "Allow-App" = { priority = 120, port = "8080", source_ip = "*", description = "Allow App Traffic" }
    }
    database = {
      "Allow-DB" = { priority = 130, port = "1433", source_ip = "*", description = "Allow SQL Server" }
    }
  }
}


variable "un_used" {
  description = "un used variable"
  type = string
  default     = "un used"
}