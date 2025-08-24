provider "google" {
  project = "ashwin-terraform-projectid"
  region  = "us-central1"
}

resource "google_sql_database_instance" "example" {
  name                 = "example-db"
  database_version     = "MYSQL_8_0"
  region               = "us-central1"
  deletion_protection  = false   # 👈 This allows Terraform to destroy the instance later

  settings {
    tier = "db-f1-micro"
  }
}
