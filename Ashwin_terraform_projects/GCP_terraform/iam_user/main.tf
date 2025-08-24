
provider "google" {
  project = "ashwin-terraform-projectid"
}

resource "google_service_account" "example" {
  account_id   = "example-user"
  display_name = "Example User"
}
