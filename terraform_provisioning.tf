# monorepo/main.tf
# Terraform entrypoint for provisioning multi-vendor network infrastructure

terraform {
  required_version = ">= 1.3.0"

  required_providers {

    # Azure
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }

    # Infoblox NIOS
    infoblox = {
      source  = "infobloxopen/infoblox"
      version = ">= 1.0.0"
    }

    # F5 BIG-IP
    f5 = {
      source  = "F5Networks/bigip"
      version = ">= 1.0.0"
    }

    # Zscaler ZIA
    zscaler = {
      source  = "zscaler/zia"
      version = ">= 1.0.0"
    }

    # Fortinet FortiOS
    fortios = {
      source  = "fortinetdev/fortios"
      version = ">= 1.0.0"
    }

    # Palo Alto PAN-OS
    panos = {
      source  = "PaloAltoNetworks/panos"
      version = ">= 1.0.0"
    }

    # Check Point
    checkpoint = {
      source  = "CheckPointSW/checkpoint"
      version = ">= 2.0.0"
    }

    # Cisco ACI
    aci = {
      source  = "CiscoDevNet/aci"
      version = ">= 0.6.0"
    }
  }
}

##########################################
# Provider Configuration Blocks
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
  source = "./modules/aci"
}

module "ios" {
  source = "./modules/cisco_ios"

  device_ip = var.cisco_device_ip
  username  = var.cisco_username
  password  = var.cisco_password
}

module "paloalto" {
  source = "./modules/paloalto"
}

module "azure" {
  source = "./modules/azure"
}

module "infoblox" {
  source = "./modules/infoblox"
}

module "f5" {
  source = "./modules/f5"
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
}

module "juniper" {
  source = "./modules/juniper"
}

module "sd_access" {
  source = "./modules/sd_access"
}

##########################################
# Output
##########################################

output "status" {
  value = "✅ Provisioning completed. Check individual module outputs for details."
}
