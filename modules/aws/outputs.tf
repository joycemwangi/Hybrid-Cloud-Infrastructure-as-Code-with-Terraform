output "vpc_id" {
  description = "ID of the created AWS VPC"
  value       = aws_vpc.this.id
}

output "public_subnet_id" {
  description = "ID of the created public subnet"
  value       = aws_subnet.public.id
}
