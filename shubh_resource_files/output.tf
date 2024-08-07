# Output Block for EC2 and RDS Instance

output "ElasticIP" {
  value = aws_eip.ElasticIP.public_ip
}

output "PrivateIP" {
  value = aws_instance.EC2-Instance.private_ip
}

output "AMI" {
  value = aws_instance.EC2-Instance.ami
}

output "ZONE" {
  value = aws_instance.EC2-Instance.availability_zone
}

output "instance_type" {
  value = aws_instance.EC2-Instance.instance_type
}

output "rds_instance_endpoint" {
  description = "The endpoint of the RDS instance."
  value       = aws_db_instance.RDS.endpoint
}

output "rds_instance_db_name" {
  description = "The database name for the RDS instance."
  value       = aws_db_instance.RDS.db_name
}

output "rds_instance_port" {
  description = "The port of the RDS instance."
  value       = aws_db_instance.RDS.port
}


output "rds_instance_id" {
  description = "The ID of the RDS instance."
  value       = aws_db_instance.RDS.id
}