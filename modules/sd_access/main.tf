resource "null_resource" "sda_fabric_deploy" {

  triggers = {
    site = var.site_name
  }

  provisioner "local-exec" {
    command = "python3 scripts/deploy_sda_fabric.py --site ${var.site_name}"
  }
}
