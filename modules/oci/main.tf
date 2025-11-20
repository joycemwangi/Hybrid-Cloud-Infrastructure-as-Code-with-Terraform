resource "oci_core_vcn" "this" {
  compartment_id = var.compartment_id
  display_name   = var.vcn_display_name
  cidr_block     = var.vcn_cidr
  dns_label      = var.dns_label
}

resource "oci_core_subnet" "subnet" {
  compartment_id = var.compartment_id
  display_name   = var.subnet_display_name
  vcn_id         = oci_core_vcn.this.id
  cidr_block     = var.subnet_cidr
}
