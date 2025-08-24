provider "aws" {
  region = "us-east-1"
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name              = "exampledb"       # Corrected to db_name
  username             = "admin"
  password             = "admin1234"
  skip_final_snapshot  = true
  identifier           = "example-db-instance"  # Corrected to identifier
}
