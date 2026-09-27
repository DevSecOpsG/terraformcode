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

resource "google_storage_bucket" "bucket" {
  name                        = "batch25terraformbucket"
  location                    = "US-EAST1"
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
}