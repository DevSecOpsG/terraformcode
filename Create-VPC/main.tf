# Create a VPC
resource "aws_vpc" "ashwan-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "ashwan-vpc"
  }
}

# Creating private subnet
resource "aws_subnet" "private-subnet" {
  cidr_block = "10.0.1.0/24"
  vpc_id = aws_vpc.ashwan-vpc.id

  tags = {
    Name = "private-subnet"
  }
}

# Creating public subnet
resource "aws_subnet" "public-subnet" {
  cidr_block = "10.0.2.0/24"
  vpc_id = aws_vpc.ashwan-vpc.id

  tags = {
    Name = "public-subnet"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "ashwan-igw" {
  vpc_id = aws_vpc.ashwan-vpc.id

  tags = {
    Name = "ashwan-igw"
  }
}

# Routing table
resource "aws_route_table" "ashwan-rt" {
  vpc_id =aws_vpc.ashwan-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ashwan-igw.id
  }
}

resource "aws_route_table_association" "public-sub" {
  route_table_id = aws_route_table.ashwan-rt.id
  subnet_id = aws_subnet.public-subnet.id
}