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
    command = "ansible-playbook push-container/main-playbook.yml -e 'credentials_file=../${var.credentials_file} registry_url=${var.region}-docker.pkg.dev/${var.project}/${google_artifact_registry_repository.my-repo.repository_id} image_name=${var.image_name}'"
  }
}

