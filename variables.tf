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
# Juniper Junos Variables (passed to module "juniper")
##########################################################

variable "juniper_device_ip" {
  description = "Management IP address of the Juniper device"
  type        = string
}

variable "juniper_username" {
  description = "Username for the Juniper device"
  type        = string
}

variable "juniper_password" {
  description = "Password for the Juniper device"
  type        = string
  sensitive   = true
}

##########################################################
# F5 BIG-IP Variables (passed to module "f5")
##########################################################

variable "f5_vs_name" {
  description = "Name of the F5 Virtual Server"
  type        = string
}

variable "f5_destination" {
  description = "Destination IP:Port for the F5 Virtual Server"
  type        = string
}

##########################################################
# Fortinet FortiOS Variables (passed to module "fortinet")
##########################################################

variable "fortinet_addr_name" {
  description = "Name for the Fortinet firewall address object"
  type        = string
}

variable "fortinet_subnet" {
  description = "Subnet for the Fortinet firewall address object (e.g. 10.0.0.0/24)"
  type        = string
}

##########################################################
# Provider Credentials (from terraform.tfvars)
##########################################################

variable "infoblox_username" {
  type = string
}

variable "infoblox_password" {
  type      = string
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
  type      = string
  sensitive = true
}

variable "zscaler_username" {
  type = string
}

variable "zscaler_password" {
  type      = string
  sensitive = true
}

variable "zscaler_api_key" {
  type      = string
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
# ACI Tenant Variables
##########################################################

variable "tenant_name" {
  type = string
}
