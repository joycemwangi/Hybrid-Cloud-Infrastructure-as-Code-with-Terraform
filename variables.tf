##########################################################
# Root Variables – Used by Modules
##########################################################

# Cisco IOS / NX-OS Variables (passed to module "ios")
variable "cisco_device_ip" {
  description = "Management IP address of the Cisco IOS device"
  type        = string
}

variable "cisco_username" {
  description = "Username for the Cisco IOS device"
  type        = string
}

variable "cisco_password" {
  description = "Password for the Cisco IOS device"
  type        = string
  sensitive   = true
}

##########################################################
# Other Provider Credentials (from terraform.tfvars)
##########################################################

variable "infoblox_username" {
  type = string
}

variable "infoblox_password" {
  type = string
  sensitive = true
}

variable "infoblox_server" {
  type = string
}

variable "f5_address" {
  type = string
}

variable "f5_username" {
  type = string
}

variable "f5_password" {
  type = string
  sensitive = true
}

variable "zscaler_username" {
  type = string
}

variable "zscaler_password" {
  type = string
  sensitive = true
}

variable "zscaler_api_key" {
  type = string
  sensitive = true
}

##########################################################
# Azure Variables (module/azure)
##########################################################

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

##########################################################
# ACI
##########################################################

variable "tenant_name" {
  type = string
}
