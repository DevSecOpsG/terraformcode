
provider "google" {
  project = "ashwin-terraform-projectid"
  region  = "us-central1"
}

resource "google_container_cluster" "example" {
  name     = "example-gke"
  location = "us-central1"

  initial_node_count = 1
  deletion_protection = false
  node_config {
    machine_type = "e2-medium"
  }
}
