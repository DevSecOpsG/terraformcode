terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "us-east-1"  # Change the region as needed
}

# Allocate an Elastic IP
resource "aws_eip" "example" {
  # No additional configuration is needed for a basic Elastic IP
}

# Optionally, you can output the allocated Elastic IP address
output "elastic_ip" {
  value = aws_eip.example.public_ip
}
