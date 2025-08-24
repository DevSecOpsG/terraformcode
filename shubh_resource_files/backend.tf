# Backend configuration to store Terraform state file into S3 Bucket
terraform {
  backend "s3" {
    bucket = "terra-bucket20234"
    key    = "terra-backend/tfstate" # The path within the bucket for the state file
    region = "ap-south-1"
  }
}