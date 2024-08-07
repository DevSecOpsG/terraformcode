# Separate execution of s3 bucket creation should be done.
# aws s3api create-bucket --bucket terra-bucket20234 --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1


/**resource "aws_s3_bucket" "terraform_state" {
  bucket = "terra-bucket20234"  # Replace with a globally unique bucket name
  acl    = "private"

  tags = {
    Name        = "Terraform State Bucket"
    Environment = "Terra-Project"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.bucket

  versioning_configuration {
    status = "Enabled"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}
**/

# Separate execution of s3 bucket creation should be done.
# aws s3api create-bucket --bucket terra-bucket20234 --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1
