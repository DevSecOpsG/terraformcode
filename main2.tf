terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.0.0"
}

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

resource "aws_ecr_repository" "app" {
  name = "mohseen_ecr"

  tags = {
    Name = "mohseen_ecr"
  }
}
