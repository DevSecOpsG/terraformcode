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
  profile = "default"
  region  = "us-east-2"
}

# Create a Route 53 hosted zone
resource "aws_route53_zone" "main" {
  name = "example.com"
}

resource "aws_route53_zone" "dev" {
  name = "dev.example.com"

  tags = {
    Environment = "dev"
  }
}
resource "aws_route53_record" "dev-ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "dev.example.com"
  type    = "NS"
  ttl     = "30"
  records = aws_route53_zone.dev.name_servers
}


# Create an A record in the hosted zone
resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.primary.id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
 #records = [aws_eip.lb.public_ip]

  records = [
    "192.0.2.1"
  ]
}

# Create a CNAME record in the hosted zone
resource "aws_route53_record" "cname_record" {
  zone_id = aws_route53_zone.primary.id
  name    = "blog.example.com"
  type    = "CNAME"
  ttl     = 300

  records = [
    "www.ipexample.com"
  ]
}
