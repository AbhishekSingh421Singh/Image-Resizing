# Main infrastructure definitions

provider "aws" {
  region = var.region
}

module "s3" {
  source                  = "./modules/s3"
  source_bucket_name      = var.source_bucket_name
  destination_bucket_name = var.destination_bucket_name
  lambda_code_bucket_name = var.lambda_code_bucket_name
}

module "sns" {
  source         = "./modules/sns"
  sns_topic_name = var.sns_topic_name
}

module "lambda" {
  source                  = "./modules/lambda"
  lambda_function_name    = var.lambda_function_name
  lambda_code_bucket_name = var.lambda_code_bucket_name
  sns_topic_arn           = module.sns.sns_topic_arn
  destination_bucket_name = var.destination_bucket_name
  source_bucket_arn       = module.s3.source_bucket_arn
  lambda_role_name        = var.lambda_role_name
}