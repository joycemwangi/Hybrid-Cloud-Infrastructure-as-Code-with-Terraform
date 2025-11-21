# modules/f5/main.tf
# Demo placeholder for F5 LTM Virtual Server using null_resource

resource "null_resource" "web_vs" {
  triggers = {
    vs_name     = var.vs_name
    destination = var.destination
  }
}