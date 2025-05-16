output "source_bucket_name" {
  value = aws_s3_bucket.source.bucket
}

output "destination_bucket_name" {
  value = aws_s3_bucket.destination.bucket
}

output "lambda_code_bucket_name" {
  value = aws_s3_bucket.lambda_code.bucket
}

output "source_bucket_arn" {
  value = aws_s3_bucket.source.arn
}