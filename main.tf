# monorepo/main.tf
# Terraform entrypoint for provisioning multi-vendor network infrastructure

terraform {
  required_version = ">= 1.3.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    infoblox = {
      source  = "infobloxopen/infoblox"
      version = ">= 1.0.0"
    }

    f5 = {
      source  = "F5Networks/bigip"
      version = ">= 1.0.0"
    }

    zscaler = {
      source  = "zscaler/zia"
      version = ">= 1.0.0"
    }

    fortios = {
      source  = "fortinetdev/fortios"
      version = ">= 1.0.0"
    }

    panos = {
      source  = "PaloAltoNetworks/panos"
      version = ">= 1.0.0"
    }

    checkpoint = {
      source  = "CheckPointSW/checkpoint"
      version = ">= 2.0.0"
    }

    aci = {
      source  = "CiscoDevNet/aci"
      version = ">= 0.6.0"
    }

    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }

    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }

    oci = {
      source  = "oracle/oci"
      version = "~> 6.0"
    }
  }
}

##########################################
# Providers
##########################################

provider "azurerm" {
  features {}
}

provider "infoblox" {
  username = var.infoblox_username
  password = var.infoblox_password
  server   = var.infoblox_server
}

provider "f5" {
  address  = var.f5_address
  username = var.f5_username
  password = var.f5_password
}

provider "zscaler" {
  username = var.zscaler_username
  password = var.zscaler_password
  api_key  = var.zscaler_api_key
}

provider "aws" {
  region = var.aws_region
}

provider "google" {
  project = var.gcp_project
  region  = var.gcp_region
}

provider "oci" {
  tenancy_ocid     = var.oci_tenancy_ocid
  user_ocid        = var.oci_user_ocid
  fingerprint      = var.oci_fingerprint
  private_key_path = var.oci_private_key_path
  region           = var.oci_region
}

##########################################
# Core Modules
##########################################

module "azure" {
  source   = "./modules/azure"
  rg_name  = var.rg_name
  location = var.location
}

module "aws" {
  source             = "./modules/aws"
  region             = var.aws_region
  vpc_cidr           = var.aws_vpc_cidr
  public_subnet_cidr = var.aws_public_subnet_cidr
  public_subnet_az   = var.aws_public_subnet_az
  project_name       = var.project_name
}

module "gcp" {
  source       = "./modules/gcp"
  project_id   = var.gcp_project
  network_name = var.gcp_network_name
  subnet_name  = var.gcp_subnet_name
  region       = var.gcp_region
  subnet_cidr  = var.gcp_subnet_cidr
}

module "oci" {
  source = "./modules/oci"
}

module "aci" {
  source      = "./modules/aci"
  tenant_name = var.tenant_name
}

module "ios" {
  source    = "./modules/cisco_ios"
  device_ip = var.cisco_device_ip
  username  = var.cisco_username
  password  = var.cisco_password
}

module "juniper" {
  source    = "./modules/juniper"
  device_ip = var.juniper_device_ip
  username  = var.juniper_username
  password  = var.juniper_password
}

module "paloalto" {
  source       = "./modules/paloalto"
  object_name  = var.paloalto_object_name
  object_value = var.paloalto_object_value
  object_type  = var.paloalto_object_type
  tags         = var.paloalto_tags
}

module "infoblox" {
  source   = "./modules/infoblox"
  hostname = var.infoblox_hostname
  ipv4addr = var.infoblox_ipv4addr
}

module "f5" {
  source      = "./modules/f5"
  vs_name     = var.f5_vs_name
  destination = var.f5_destination
}

module "zscaler" {
  source    = "./modules/zscaler"
  rule_name = var.zscaler_rule_name
}

##########################################
# Optional Modules
##########################################

module "checkpoint" {
  source     = "./modules/checkpoint"
  host_name  = var.host_name
  ip_address = var.ip_address
}

module "fortinet" {
  source    = "./modules/fortinet"
  addr_name = var.fortinet_addr_name
  subnet    = var.fortinet_subnet
}

module "sd_access" {
  source    = "./modules/sd_access"
  site_name = var.site_name
}

module "panorama_access" {
  source         = "./modules/panorama-access"
  admin_username = var.panorama_admin_username
  admin_password = var.panorama_admin_password
  admin_role     = var.panorama_admin_role
}

##########################################
# Outputs
##########################################

output "status" {
  value = "Provisioning completed. Check individual module outputs for details."
}

output "juniper_device_ip" {
  value = module.juniper.device_ip
}

output "juniper_hostname" {
  value = try(module.juniper.hostname, null)
}

output "juniper_loopback_ip" {
  value = try(module.juniper.loopback_ip, null)
}

output "paloalto_object_name" {
  value = module.paloalto.object_name
}

output "paloalto_object_type" {
  value = module.paloalto.object_type
}

output "paloalto_object_tags" {
  value = module.paloalto.object_tags
}

output "sd_access_site_name" {
  value = module.sd_access.site_name
}

output "panorama_admin_username" {
  value = module.panorama_access.admin_username
}

output "zscaler_rule_name" {
  value = module.zscaler.rule_name
}

output "aws_module_outputs" {
  description = "Outputs from AWS module"
  value       = module.aws
}

output "gcp_module_outputs" {
  description = "Outputs from GCP module"
  value       = module.gcp
}

output "oci_module_outputs" {
  description = "Outputs from OCI module"
  value       = module.oci
}
