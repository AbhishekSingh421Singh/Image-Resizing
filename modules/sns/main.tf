resource "aws_sns_topic" "image_processing_topic" {
  name = var.sns_topic_name
}