output "sns_topic_arn" {
  value = aws_sns_topic.image_processing_topic.arn
}