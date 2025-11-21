output "object_name" {
  value = null_resource.core_firewall_obj.triggers.object_name
}

output "object_type" {
  value = null_resource.core_firewall_obj.triggers.object_type
}

output "object_tags" {
  value = split(",", null_resource.core_firewall_obj.triggers.tags)
}