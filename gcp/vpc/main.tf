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

resource "google_compute_network" "network" {
  name                    = "my-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "private" {
  name                     = "private"
  ip_cidr_range            = "10.0.1.0/24"
  region                   = "us-east1"
  network                  = google_compute_network.network.id
  private_ip_google_access = true
}

resource "google_compute_subnetwork" "public" {
  name          = "public"
  ip_cidr_range = "10.0.101.0/24"
  region        = "us-east1"
  network       = google_compute_network.network.id
}

resource "google_compute_router" "network" {
  name    = "my-vpc-router"
  region  = "us-east1"
  network = google_compute_network.network.id
}

resource "google_compute_router_nat" "private" {
  name                               = "my-vpc-nat"
  router                             = google_compute_router.network.name
  region                             = google_compute_router.network.region
  nat_ip_allocate_option             = "AUTO_ONLY"
  source_subnetwork_ip_ranges_to_nat = "LIST_OF_SUBNETWORKS"

  subnetwork {
    name                    = google_compute_subnetwork.private.id
    source_ip_ranges_to_nat = ["ALL_IP_RANGES"]
  }
}

resource "google_compute_ha_vpn_gateway" "network" {
  name    = "my-vpc-vpn-gateway"
  region  = "us-east1"
  network = google_compute_network.network.id
}