# monorepo/terraform_provisioning.tf
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

    # For null_resource used in IOS and Juniper modules
    null = {
      source  = "hashicorp/null"
      version = ">= 3.0.0"
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

##########################################
# Core Modules
##########################################

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

# JUNIPER MODULE – UPDATED
module "juniper" {
  source    = "./modules/juniper"
  device_ip = var.juniper_device_ip
  username  = var.juniper_username
  password  = var.juniper_password

  # Only include these if you defined them in variables.tf & module variables
  hostname    = var.juniper_hostname
  loopback_ip = var.juniper_loopback_ip
  asn         = var.juniper_asn
}

# PALO ALTO MODULE – UPDATED
module "paloalto" {
  source = "./modules/paloalto"

  object_name  = var.paloalto_object_name
  object_value = var.paloalto_object_value
  object_type  = var.paloalto_object_type
  tags         = var.paloalto_tags
}

module "azure" {
  source   = "./modules/azure"
  rg_name  = var.rg_name
  location = var.location
}

module "infoblox" {
  source = "./modules/infoblox"
}

module "f5" {
  source      = "./modules/f5"
  vs_name     = var.f5_vs_name
  destination = var.f5_destination
}

module "zscaler" {
  source = "./modules/zscaler"
}

##########################################
# Optional Modules
##########################################

module "checkpoint" {
  source = "./modules/checkpoint"
}

module "fortinet" {
  source = "./modules/fortinet"

  addr_name = var.fortinet_addr_name
  subnet    = var.fortinet_subnet
}

module "sd_access" {
  source = "./modules/sd_access"
}

##########################################
# Outputs
##########################################

# Global status
output "status" {
  value = "✅ Provisioning completed. Check individual module outputs for details."
}

# Juniper-specific outputs (match outputs in ./modules/juniper/outputs.tf)
output "juniper_device_ip" {
  value = module.juniper.device_ip
}

output "juniper_hostname" {
  value = module.juniper.hostname
}

output "juniper_loopback_ip" {
  value = module.juniper.loopback_ip
}

# Palo Alto-specific outputs (match outputs in ./modules/paloalto/outputs.tf)
output "paloalto_object_name" {
  value = module.paloalto.object_name
}

output "paloalto_object_type" {
  value = module.paloalto.object_type
}

output "paloalto_object_tags" {
  value = module.paloalto.object_tags
}
