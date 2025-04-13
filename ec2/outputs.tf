output "ec2_instance_id" {
  value = aws_instance.clouddevopshub.id
}

output "ec2_public_ip" {
  value = aws_instance.clouddevopshub.public_ip
}
