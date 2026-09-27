terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.0.0"
}

variable "project_id" {
  description = "Google Cloud project ID."
  type        = string
}

provider "google" {
  project = var.project_id
  region  = "us-east1"
}

resource "google_compute_instance" "app_server" {
  name         = "example-app-server-instance"
  machine_type = "e2-micro"
  zone         = "us-east1-b"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-12"
    }
  }

  network_interface {
    network = "default"

    access_config {}
  }
}