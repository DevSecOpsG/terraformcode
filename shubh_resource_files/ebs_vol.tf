/*resource "aws_ebs_volume" "terra-EBS" {
  availability_zone = var.ZONE1
  size              = 2
  tags = {
    Name = "Extra Volume Attachment"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.terra-EBS.id
  instance_id = aws_instance.EC2-Instance.id
}
*/