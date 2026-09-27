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

resource "google_compute_network" "eks_vpc" {
  name                    = "my-gke-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "eks_subnet_a" {
  name                     = "my-gke-subnet"
  ip_cidr_range            = "10.0.1.0/24"
  region                   = "us-east1"
  network                  = google_compute_network.eks_vpc.id
  private_ip_google_access = true
}

resource "google_container_cluster" "example" {
  name                     = "my-gke-cluster"
  location                 = "us-east1"
  network                  = google_compute_network.eks_vpc.name
  subnetwork               = google_compute_subnetwork.eks_subnet_a.name
  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "example" {
  name       = "default-pool"
  location   = google_container_cluster.example.location
  cluster    = google_container_cluster.example.name
  node_count = 1

  node_config {
    machine_type = "e2-medium"
    oauth_scopes = ["https://www.googleapis.com/auth/cloud-platform"]
  }
}