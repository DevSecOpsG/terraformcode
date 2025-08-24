# AWS Key Pair
resource "aws_key_pair" "key" {
  key_name   = "terra-key"
  public_key = file("terra-key.pub")
}

# Create EC2 Instance
resource "aws_instance" "EC2-Instance" {
  ami                    = var.AMIs[var.REGION]
  instance_type          = var.INST_TYPE
  subnet_id              = aws_subnet.public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.terra-SG.id]
  key_name               = aws_key_pair.key.key_name
  tags = {
    Name    = "terraform instance"
    Purpose = "Test of terraform code"
  }

  user_data = file("web.sh") # Userdata to bo executed after server provisioning
  /**
  # Transfer file from local env to server
  provisioner "file" {
    source      = "web.sh"
    destination = "/tmp/web.sh"
  }

  # Remote commands on server
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/web.sh",
      "sudo /tmp/web.sh"
    ]
  }

  # SSH into server
  connection {
    user        = var.user
    private_key = file("terra-key")
    host        = self.public_ip
  } 
  **/
}



# Allocate an Elastic IP
resource "aws_eip" "ElasticIP" {
  instance = aws_instance.EC2-Instance.id
}

# Create an RDS instance
resource "aws_db_instance" "RDS" {
  identifier             = "my-rds-instance"
  instance_class         = "db.t3.micro" # Change to your desired instance type
  engine                 = "mysql"       # Change to your preferred database engine (e.g., postgres, oracle)
  engine_version         = "8.0"         # Change to the version of the engine you're using
  allocated_storage      = 20            # Size in GB
  username               = "admin"       # Master username
  password               = "admin123"    # Master password
  db_name                = "mydatabase"  # Initial database name
  publicly_accessible    = true          # Set to false for private instances
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  storage_type           = "gp2" # General Purpose SSD
  skip_final_snapshot    = true  # Set to false if you want to store final snapshot

  tags = {
    Name = "MyRDSInstance"
  }
}

# Create extra EBS Volume
resource "aws_ebs_volume" "terra-EBS" {
  availability_zone = var.ZONE1
  size              = 2
  tags = {
    Name = "Extra Volume Attachment"
  }
}

# Attach extra EBS Volume to Instance
resource "aws_volume_attachment" "extra_ebs_att" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.terra-EBS.id
  instance_id = aws_instance.EC2-Instance.id
}