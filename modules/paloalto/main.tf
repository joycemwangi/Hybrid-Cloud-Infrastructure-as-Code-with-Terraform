# modules/paloalto/main.tf
# Demo placeholder for Palo Alto address object

resource "null_resource" "core_firewall_obj" {
  triggers = {
    object_name  = var.object_name
    object_value = var.object_value
    object_type  = var.object_type
    tags         = join(",", var.tags)
  }
}