output "container_registry_url" {
  value = "${var.region}-docker.pkg.dev/${var.project}/${google_artifact_registry_repository.my-repo.repository_id}"
}

output "image_name" {
  value = var.image_name
}

