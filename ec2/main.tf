resource "aws_instance" "clouddevopshub" {
  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  tags = {
    Name = var.ec2_instance_name
  }
}
