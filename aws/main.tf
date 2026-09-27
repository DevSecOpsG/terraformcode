terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

variable "region" {
  description = "AWS region for the root S3 module scaffold."
  type        = string
}

provider "aws" {
    region = var.region
}

module "s3" {
    source = "<path-to-S3-folder>"
    #bucket name should be unique
    bucket_name = "<Bucket-name>"       
}