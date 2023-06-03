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

resource "google_cloud_run_v2_service" "default" {
  name     = "cloudrun-service"
  location = var.zone
  ingress  = "INGRESS_TRAFFIC_ALL"

  template {
    containers {
      image = "https://hub.docker.com/r/rocker/shiny"
    }
  }
}
