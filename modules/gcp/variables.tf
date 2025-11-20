variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "network_name" {
  description = "Name of the GCP VPC network"
  type        = string
}

variable "subnet_name" {
  description = "Name of the GCP subnet"
  type        = string
}

variable "region" {
  description = "GCP region for the subnet"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR range for the subnet (e.g. 10.20.0.0/24)"
  type        = string
}
