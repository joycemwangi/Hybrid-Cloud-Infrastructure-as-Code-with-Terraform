variable "object_name" {
  type = string
}

variable "object_value" {
  type = string
}

# NEW — Address object type (ip-netmask, ip-range, fqdn)
variable "object_type" {
  type    = string
  default = "ip-netmask"
}

# NEW — Tags to attach to the Palo Alto address object
variable "tags" {
  type    = list(string)
  default = ["terraform-managed"]
}
