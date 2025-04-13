
provider "google" {
  project = "ashwin-terraform-projectid"
  region  = "us-central1"
}

resource "google_compute_instance" "example" {
  name         = "vm-instance"
  machine_type = "f1-micro"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"
    access_config {}
  }
}
