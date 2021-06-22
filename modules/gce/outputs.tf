output "instance_name" {
  value       = local.instance_name
  description = "Name of GCE VM Instance."
}

output "id" {
  value       = google_compute_instance.gce.id
  description = "An identifier for the resource with format projects/{{project}}/zones/{{zone}}/instances/{{name}}"
}

output "instance_id" {
  value       = google_compute_instance.gce.instance_id
  description = "The server-assigned unique identifier of this instance. Example: 4567719474035761998"
}

output "self_link" {
  value       = google_compute_address.gce_static_ip.self_link
  description = "The URI of the External Static IP resource."
}

output "email" {
  value       = google_service_account.gce_sa.email
  description = "The URI of the Google Service Account resource."
}

output "sa_id" {
  value       = local.sa_id
  description = "Display Name of created Google Service Account"
}

output "region" {
  value       = data.google_client_config.google_client.region
  description = "GCP Region in which GCE VM Instance being created"
}
