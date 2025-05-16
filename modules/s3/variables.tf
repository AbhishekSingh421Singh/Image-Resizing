variable "source_bucket_name" {
  description = "Name of the source S3 bucket"
  type        = string
}

variable "destination_bucket_name" {
  description = "Name of the destination S3 bucket"
  type        = string
}

variable "lambda_code_bucket_name" {
  description = "Name of the S3 bucket for Lambda code"
  type        = string
}