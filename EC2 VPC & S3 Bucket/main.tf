provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Example for Amazon Linux 2 in us-west-2
  instance_type = "t2.micro"

  tags = {
    Name = "MyWebServer"
  }

  key_name = "your-key-pair-name" # Replace with your key pair
}
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "adminpassword123" # use secrets manager in production!
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  tags = {
    Name = "MyRDSInstance"
  }
}
resource "aws_security_group" "allow_web" {
  name        = "allow_web"
  description = "Allow HTTP and MySQL"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["your-ec2-ip/32"] # Only allow EC2 to access RDS
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

