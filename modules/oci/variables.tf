variable "compartment_id" {
  description = "OCI compartment OCID"
  type        = string
}

variable "vcn_display_name" {
  description = "Display name for the VCN"
  type        = string
}

variable "vcn_cidr" {
  description = "CIDR block for the VCN"
  type        = string
}

variable "subnet_display_name" {
  description = "Display name for the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "dns_label" {
  description = "DNS label for the VCN (must be unique in the region)"
  type        = string
}
