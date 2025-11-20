##############################################
# Global Cloud Variables
##############################################

# AWS
variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

# GCP
variable "gcp_project" {
  description = "GCP Project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

# OCI
variable "oci_tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "oci_user_ocid" {
  description = "OCI user OCID"
  type        = string
}

variable "oci_fingerprint" {
  description = "OCI API fingerprint"
  type        = string
}

variable "oci_private_key_path" {
  description = "Path to OCI API private key"
  type        = string
}

variable "oci_region" {
  description = "OCI region"
  type        = string
  default     = "us-ashburn-1"
}

##############################################
# Azure
##############################################

variable "rg_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region"
  type        = string
}

##############################################
# Infoblox
##############################################

variable "infoblox_username" {
  type        = string
  description = "Infoblox username"
}

variable "infoblox_password" {
  type        = string
  description = "Infoblox password"
}

variable "infoblox_server" {
  type        = string
  description = "Infoblox server URL"
}

##############################################
# F5 Big-IP
##############################################

variable "f5_address" {
  type        = string
  description = "F5 management IP"
}

variable "f5_username" {
  type        = string
}

variable "f5_password" {
  type        = string
}

variable "f5_vs_name" {
  type        = string
}

variable "f5_destination" {
  type        = string
}

##############################################
# Zscaler
##############################################

variable "zscaler_username" {
  type = string
}

variable "zscaler_password" {
  type = string
}

variable "zscaler_api_key" {
  type = string
}

variable "zscaler_rule_name" {
  type        = string
  description = "Zscaler rule name"
}

##############################################
# Cisco ACI
##############################################

variable "tenant_name" {
  type        = string
  description = "ACI tenant name"
}

##############################################
# Cisco IOS / NX-OS
##############################################

variable "cisco_device_ip" {
  type = string
}

variable "cisco_username" {
  type = string
}

variable "cisco_password" {
  type = string
}

##############################################
# Juniper
##############################################

variable "juniper_device_ip" {
  type = string
}

variable "juniper_username" {
  type = string
}

variable "juniper_password" {
  type = string
}

variable "juniper_hostname" {
  type    = string
  default = "juniper-device"
}

variable "juniper_loopback_ip" {
  type    = string
  default = "10.10.10.1/32"
}

variable "juniper_asn" {
  type    = number
  default = 65000
}

##############################################
# Palo Alto Networks
##############################################

variable "paloalto_object_name" {
  type = string
}

variable "paloalto_object_value" {
  type = string
}

variable "paloalto_object_type" {
  type    = string
  default = "ip-netmask"
}

variable "paloalto_tags" {
  type    = list(string)
  default = []
}

##############################################
# Fortinet
##############################################

variable "fortinet_addr_name" {
  type = string
}

variable "fortinet_subnet" {
  type = string
}

##############################################
# SD-Access
##############################################

variable "site_name" {
  type = string
}

##############################################
# Panorama Admin
##############################################

variable "panorama_admin_username" {
  type = string
}

variable "panorama_admin_password" {
  type = string
}

variable "panorama_admin_role" {
  type    = string
  default = "superuser"
}

##############################################
# Check Point (Fixes your validation error)
##############################################

variable "host_name" {
  description = "Host name for Check Point gateway"
  type        = string
}

variable "ip_address" {
  description = "IP address for Check Point gateway"
  type        = string
}

##############################################
# END
##############################################
