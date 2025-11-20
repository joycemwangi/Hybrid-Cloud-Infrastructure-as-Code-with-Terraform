##############################################
# Global Cloud Variables
##############################################

# AWS
variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-1"
}

variable "aws_vpc_cidr" {
  description = "CIDR block for the AWS VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_public_subnet_cidr" {
  description = "CIDR block for the public subnet in the AWS VPC"
  type        = string
  default     = "10.0.1.0/24"
}

variable "aws_public_subnet_az" {
  description = "Availability Zone for the public subnet"
  type        = string
  default     = "us-east-1a"
}

variable "project_name" {
  description = "Project name tag prefix for AWS resources"
  type        = string
  default     = "multivendor-demo"
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
  sensitive   = true
}

variable "infoblox_server" {
  type        = string
  description = "Infoblox server URL or IP"
}

# Used by modules/infoblox
variable "infoblox_hostname" {
  description = "Hostname to register in Infoblox"
  type        = string
  default     = "demo-host.example.local"
}

variable "infoblox_ipv4addr" {
  description = "IPv4 address to associate with the Infoblox host record"
  type        = string
  default     = "192.0.2.10"
}

##############################################
# F5 Big-IP
##############################################

variable "f5_address" {
  type        = string
  description = "F5 management IP or hostname"
}

variable "f5_username" {
  type        = string
  description = "F5 username"
}

variable "f5_password" {
  type        = string
  description = "F5 password"
  sensitive   = true
}

variable "f5_vs_name" {
  type        = string
  description = "F5 Virtual Server name"
}

variable "f5_destination" {
  type        = string
  description = "F5 Virtual Server destination IP:port"
}

##############################################
# Zscaler
##############################################

variable "zscaler_username" {
  type        = string
  description = "Zscaler API username"
}

variable "zscaler_password" {
  type        = string
  description = "Zscaler API password"
  sensitive   = true
}

variable "zscaler_api_key" {
  type        = string
  description = "Zscaler API key"
  sensitive   = true
}

variable "zscaler_rule_name" {
  type        = string
  description = "Zscaler firewall filtering rule name"
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
  type        = string
  description = "Cisco IOS device management IP"
}

variable "cisco_username" {
  type        = string
  description = "Cisco IOS username"
}

variable "cisco_password" {
  type        = string
  description = "Cisco IOS password"
  sensitive   = true
}

##############################################
# Juniper
##############################################

variable "juniper_device_ip" {
  type        = string
  description = "Juniper device management IP"
}

variable "juniper_username" {
  type        = string
  description = "Juniper username"
}

variable "juniper_password" {
  type        = string
  description = "Juniper password"
  sensitive   = true
}

variable "juniper_hostname" {
  type        = string
  description = "Hostname to configure on Juniper device"
  default     = "juniper-device"
}

variable "juniper_loopback_ip" {
  type        = string
  description = "Loopback interface IP (CIDR) on Juniper"
  default     = "10.10.10.1/32"
}

variable "juniper_asn" {
  type        = number
  description = "BGP ASN for Juniper device"
  default     = 65000
}

##############################################
# Palo Alto Networks
##############################################

variable "paloalto_object_name" {
  type        = string
  description = "Palo Alto address object name"
}

variable "paloalto_object_value" {
  type        = string
  description = "Palo Alto address object value (IP/CIDR/FQDN)"
}

variable "paloalto_object_type" {
  type        = string
  description = "Palo Alto address object type"
  default     = "ip-netmask"
}

variable "paloalto_tags" {
  type        = list(string)
  description = "Tags to attach to Palo Alto address object"
  default     = []
}

##############################################
# Fortinet
##############################################

variable "fortinet_addr_name" {
  type        = string
  description = "Fortinet address object name"
}

variable "fortinet_subnet" {
  type        = string
  description = "Fortinet address object subnet (CIDR)"
}

##############################################
# SD-Access
##############################################

variable "site_name" {
  type        = string
  description = "Cisco SD-Access site name"
}

##############################################
# Panorama Admin
##############################################

variable "panorama_admin_username" {
  type        = string
  description = "Panorama admin username"
}

variable "panorama_admin_password" {
  type        = string
  description = "Panorama admin password"
  sensitive   = true
}

variable "panorama_admin_role" {
  type        = string
  description = "Panorama admin role"
  default     = "superuser"
}

##############################################
# Check Point
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
