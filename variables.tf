##########################################################
# Cisco IOS / NX-OS Variables
##########################################################

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
# Juniper Junos Variables
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
# F5 BIG-IP Variables
##########################################################

variable "f5_vs_name" {
  description = "Name of the F5 Virtual Server"
  type        = string
}

variable "f5_destination" {
  description = "Destination IP:Port for the F5 Virtual Server"
  type        = string
}

variable "f5_address" {
  description = "Management IP or DNS of the F5 device"
  type        = string
}

variable "f5_username" {
  description = "Username for the F5 device"
  type        = string
}

variable "f5_password" {
  description = "Password for the F5 device"
  type        = string
  sensitive   = true
}

##########################################################
# Fortinet FortiOS Variables
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
# Palo Alto PAN-OS Variables
##########################################################

variable "paloalto_object_name" {
  description = "Name of the Palo Alto address object"
  type        = string
}

variable "paloalto_object_value" {
  description = "Value of the Palo Alto address object (IP, CIDR, IP-range, FQDN)"
  type        = string
}

variable "paloalto_object_type" {
  description = "Type of address object (ip-netmask, ip-range, fqdn, ip-wildcard)"
  type        = string
  default     = "ip-netmask"
}

variable "paloalto_tags" {
  description = "List of tags to apply to the Palo Alto object"
  type        = list(string)
  default     = ["terraform-managed"]
}

##########################################################
# Infoblox Provider Credentials
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

##########################################################
# Zscaler ZIA Provider Credentials
##########################################################

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

# Required for modules/zscaler
variable "zscaler_rule_name" {
  description = "Name of the Zscaler firewall filtering rule"
  type        = string
}

##########################################################
# Azure (passed to module/azure)
##########################################################

variable "rg_name" {
  description = "Azure Resource Group name"
  type        = string
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
}

##########################################################
# Cisco ACI Variables
##########################################################

variable "tenant_name" {
  description = "ACI tenant name"
  type        = string
}

##########################################################
# Cisco SD-Access Variables
##########################################################

variable "site_name" {
  description = "Name of the SD-Access site to deploy"
  type        = string
}

##########################################################
# Panorama Admin Access Variables
##########################################################

variable "panorama_admin_username" {
  description = "Panorama admin username to create"
  type        = string
}

variable "panorama_admin_password" {
  description = "Panorama admin password (retrieved from AWS Secrets Manager)"
  type        = string
  sensitive   = true
}

variable "panorama_admin_role" {
  description = "Role for the Panorama admin user (superuser, deviceadmin, vsysadmin...)"
  type        = string
  default     = "superuser"
}

##########################################################
# AWS Variables
##########################################################

variable "aws_region" {
  description = "AWS region for deployment (e.g. us-east-1)"
  type        = string
}

##########################################################
# GCP Variables
##########################################################

variable "gcp_project" {
  description = "GCP project ID"
  type        = string
}

variable "gcp_region" {
  description = "GCP region for deployment (e.g. europe-west1)"
  type        = string
}

##########################################################
# OCI Variables
##########################################################

variable "oci_tenancy_ocid" {
  description = "OCI tenancy OCID"
  type        = string
}

variable "oci_user_ocid" {
  description = "OCI user OCID"
  type        = string
}

variable "oci_fingerprint" {
  description = "OCI API key fingerprint"
  type        = string
}

variable "oci_private_key_path" {
  description = "Path to the OCI API private key file"
  type        = string
}

variable "oci_region" {
  description = "OCI region identifier (e.g. eu-frankfurt-1)"
  type        = string
}
