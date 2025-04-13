
provider "google" {
  project = "ashwin-terraform-projectid"
  region  = "us-central1"
}

resource "google_compute_network" "example" {
  name                    = "custom-vpc"
  auto_create_subnetworks = false
}
