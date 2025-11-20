variable "project_name" {
  description = "Name prefix for AWS resources"
  type        = string
}

variable "region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
}

variable "public_subnet_az" {
  description = "Availability Zone for the public subnet (e.g. us-east-1a)"
  type        = string
}

variable "tags" {
  description = "Common tags for all AWS resources"
  type        = map(string)
  default     = {}
}
