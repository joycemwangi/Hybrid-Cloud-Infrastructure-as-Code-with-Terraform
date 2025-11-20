resource "panos_panorama_admin" "admin_user" {
  name     = var.admin_username
  password = var.admin_password
  role     = var.admin_role
}

