
provider "google" {
  project = "ashwin-terraform-projectid"
  region  = "us-central1"
}

resource "google_storage_bucket" "example" {
  name     = "my-unique-gcs-bucket-12345678"
  location = "US"
}
