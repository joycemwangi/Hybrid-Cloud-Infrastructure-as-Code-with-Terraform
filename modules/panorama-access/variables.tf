variable "admin_username" {
  description = "Panorama admin username to create"
  type        = string
}

variable "admin_password" {
  description = "Panorama admin password (sourced from AWS Secrets Manager)"
  type        = string
  sensitive   = true
}

variable "admin_role" {
  description = "Panorama role for the admin user (superuser, deviceadmin, vsysadmin...)"
  type        = string
  default     = "superuser"
}

