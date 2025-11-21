# modules/infoblox/main.tf
# Demo placeholder for Infoblox host record

resource "null_resource" "dns_record" {
  triggers = {
    hostname = var.hostname
    ipv4addr = var.ipv4addr
  }
}