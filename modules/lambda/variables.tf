variable "lambda_function_name" {
  description = "Name of the Lambda function"
  type        = string
}

variable "lambda_code_bucket_name" {
  description = "S3 bucket where Lambda code is stored"
  type        = string
}

variable "sns_topic_arn" {
  description = "ARN of the SNS topic"
  type        = string
}

variable "destination_bucket_name" {
  description = "Name of the destination S3 bucket"
  type        = string
}

variable "source_bucket_arn" {
  description = "ARN of the source S3 bucket"
  type        = string
}

variable "lambda_role_name" {
  description = "Name of the IAM role for Lambda"
  type        = string
}