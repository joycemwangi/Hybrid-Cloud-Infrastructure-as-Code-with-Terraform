# modules/panorama-access/main.tf
# Demo placeholder for Panorama admin user

resource "null_resource" "admin_user" {
  triggers = {
    admin_username = var.admin_username
    admin_role     = var.admin_role
  }
}