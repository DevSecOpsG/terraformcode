resource "aws_sns_topic" "alerts" {
  name = var.sns_topic_name
}
