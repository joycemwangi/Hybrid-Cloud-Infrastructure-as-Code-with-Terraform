##########################################################
# Root Variables – Used by Modules
##########################################################

# Cisco IOS / NX-OS Variables (module "ios")
variable "cisco_device_ip" {
  description = "Management IP of Cisco IOS device"
  type        = string
}

variable "cisco_username" {
  description = "Username for Cisco IOS device"
  type        = string
}

variable "cisco_password" {
  description = "Password for Cisco IOS device"
  type        = string
  sensitive   = true
}

##########################################################
# F5 BIG-IP Variables (module "f5")
##########################################################

variable "f5_vs_name" {
  description = "Name of the F5 Virtual Server"
  type        = string
}

variable "f5_destination" {
  description = "Destination IP:Port for F5 VS"
  type        = string
}

##########################################################
# Fortinet Firewall Variables (module "fortinet")
##########################################################

variable "fortinet_addr_name" {
  description = "Name of Fortinet Firewall Address Object"
  type        = string
}

variable "fortinet_subnet" {
  description = "CIDR subnet used in Fortinet Address Object"
  type        = string
}

##########################################################
# Provider Credentials (from terraform.tfvars)
##########################################################

variable "infoblox_username" {
  type = string
}

variable "infoblox_password" {
  type        = string
  sensitive   = true
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
  type        = string
  sensitive   = true
}

variable "zscaler_username" {
  type = string
}

variable "zscaler_password" {
  type        = string
  sensitive   = true
}

variable "zscaler_api_key" {
  type        = string
  sensitive   = true
}

##########################################################
# Azure Variables (module "azure")
##########################################################

variable "rg_name" {
  type = string
}

variable "location" {
  type = string
}

##########################################################
# ACI Tenant Variables (module "aci")
##########################################################

variable "tenant_name" {
  type = string
}
