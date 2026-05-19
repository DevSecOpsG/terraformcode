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
  region  = "us-west-2"
}

resource "aws_iam_user" "lb" {
  name = "Nagesh123"
}
resource "aws_iam_user_policy_attachment" "admin_access" {
  user       = aws_iam_user.lb.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
