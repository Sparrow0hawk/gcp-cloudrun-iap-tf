terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_artifact_registry_repository" "my-repo" {
  location      = var.region
  repository_id = join("", [var.project, "-ecr"])
  description   = "example docker repository"
  format        = "DOCKER"

  provisioner "local-exec" {
    command = "ansible-playbook main-playbook.yml -e 'credential_file=${var.credentials_file} registry_url=${google_container_registry.registry.bucket_self_link} image_name=${var.image_name}'"
  }
}

