
resource "aws_iam_user" "ashwan-user" {
  name = "ashwan-cloud-user"
  path = "/"
}

resource "aws_iam_access_key" "user_access_key" {
  user = aws_iam_user.ashwan-user.name
}


