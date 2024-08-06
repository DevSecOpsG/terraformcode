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

# Data source to get the default VPC
data "aws_vpc" "default" {
  default = true
}

# Data source to get the default subnet in the default VPC
data "aws_subnet" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "default-for-az"
    values = ["true"]
  }

  availability_zone = "us-east-1a"  # Change the availability zone as needed
}

# Data source to get the default security group in the default VPC
data "aws_security_group" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "group-name"
    values = ["default"]
  }
}

# Create an EC2 instance in the default VPC and subnet
resource "aws_instance" "web" {
  ami                    = "ami-0ba9883b710b05ac6"  # Replace with a valid AMI ID for your region
  instance_type          = "t2.micro"
  subnet_id              = data.aws_subnet.default.id
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Name = "WebServer"
  }
}

# Allocate an Elastic IP
resource "aws_eip" "web" {
  vpc = true
}

# Associate the Elastic IP with the instance
resource "aws_eip_association" "web" {
  instance_id   = aws_instance.web.id
  allocation_id = aws_eip.web.id
}
