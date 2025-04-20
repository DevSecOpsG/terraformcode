terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "ap-south-1"
}
resource "aws_iam_user" "lb" {
  name = "Batch-38"
}
resource "aws_instance" "server1" {
  ami           = "ami-0e35ddab05955cf57"
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Instance1"
  }
}
resource "aws_s3_bucket" "b" {
  bucket = "batch38terraform14042025"
}
