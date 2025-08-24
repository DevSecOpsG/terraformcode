#Creating VPC, 3 Private Subnets and 3 Public Subnets
resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  tags = {
    Name = "terraform VPC"
  }
}

resource "aws_subnet" "public-subnet-1" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE1
  tags = {
    Name = "Public-Subnet-1"
  }
}

resource "aws_subnet" "public-subnet-2" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE2
  tags = {
    Name = "Public-Subnet-2"
  }
}

resource "aws_subnet" "public-subnet-3" {
  vpc_id                  = aws_vpc.terraform_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = var.ZONE3
  tags = {
    Name = "Public-Subnet-3"
  }
}

resource "aws_subnet" "private-subnet-1" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.4.0/24"
  # map_public_ip_on_launch = "true"
  availability_zone = var.ZONE1
  tags = {
    Name = "Private-Subnet-1"
  }
}

resource "aws_subnet" "private-subnet-2" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.5.0/24"
  # map_public_ip_on_launch = "true"
  availability_zone = var.ZONE2
  tags = {
    Name = "Private-Subnet-2"
  }
}

resource "aws_subnet" "private-subnet-3" {
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = "10.0.6.0/24"
  # map_public_ip_on_launch = "true"
  availability_zone = var.ZONE3
  tags = {
    Name = "Private-Subnet-3"
  }
}

resource "aws_internet_gateway" "terraform-IGW" {
  vpc_id = aws_vpc.terraform_vpc.id
  tags = {
    Name = "Terraform-IGW"
  }
}

resource "aws_route_table" "terraform-RT" {
  vpc_id = aws_vpc.terraform_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.terraform-IGW.id
  }

  tags = {
    Name = "Terraform IGW"
  }
}

resource "aws_route_table_association" "public-subnet-1a" {
  subnet_id      = aws_subnet.public-subnet-1.id
  route_table_id = aws_route_table.terraform-RT.id
}

resource "aws_route_table_association" "public-subnet-2b" {
  subnet_id      = aws_subnet.public-subnet-2.id
  route_table_id = aws_route_table.terraform-RT.id
}

resource "aws_route_table_association" "public-subnet-3c" {
  subnet_id      = aws_subnet.public-subnet-3.id
  route_table_id = aws_route_table.terraform-RT.id
}