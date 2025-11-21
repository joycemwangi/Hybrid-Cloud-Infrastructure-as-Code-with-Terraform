terraform {
  required_providers {
    checkpoint = {
      source  = "CheckPointSW/checkpoint"
      version = ">= 2.0.0"
    }
  }
}

# No resource supported by provider → simplified module

output "host_name" {
  value = var.host_name
}

output "ip_address" {
  value = var.ip_address
}
