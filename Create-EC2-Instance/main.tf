resource "aws_instance" "ec2-instance" {
  ami           = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"

  tags = {
    Name = "ashwan-isntance"
  }
}