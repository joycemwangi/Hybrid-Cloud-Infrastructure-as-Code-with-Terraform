output "object_name" {
  value = paloalto_address_object.core_firewall_obj.name
}

# NEW — show actual object type
output "object_type" {
  value = paloalto_address_object.core_firewall_obj.type
}

# NEW — show applied tags
output "object_tags" {
  value = paloalto_address_object.core_firewall_obj.tag
}
