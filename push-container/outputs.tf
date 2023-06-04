output "gcr-bucket" {
  value = google_container_registry.registry.id
}

output "container_registry_url" {
  value = google_container_registry.registry.bucket_self_link
}

output "image_name" {
  value = var.image_name
}
