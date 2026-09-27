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

resource "google_service_account" "adam" {
  account_id   = "adam"
  display_name = "Adam"
}