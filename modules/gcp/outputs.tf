output "network_name" {
  description = "GCP VPC network name"
  value       = google_compute_network.this.name
}

output "subnet_self_link" {
  description = "Self link of the GCP subnet"
  value       = google_compute_subnetwork.subnet.self_link
}
