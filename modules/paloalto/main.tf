resource "panos_address_object" "core_firewall_obj" {
  name        = var.object_name
  value       = var.object_value
  type        = var.object_type
  tags        = var.tags
  description = "Managed by Terraform"
}
