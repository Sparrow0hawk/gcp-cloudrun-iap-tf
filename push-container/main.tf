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

resource "google_container_registry" "registry" {
  project  = var.project
  location = var.region

  provisioner "local-exec" {
    command = "ansible-playbook main-playbook.yml -e 'credential_file=${var.credentials_file} registry_url=${google_container_registry.registry.bucket_self_link} image_name=${var.image_name}'"
  }
}

