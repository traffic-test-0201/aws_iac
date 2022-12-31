# This example will work with terraform 12 and higher
terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.76"
    }
  }
  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region = "ap-northeast-2"
}

resource "aws_s3_bucket" "variable_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket_versioning" "variable_bucket_version" {
  bucket = aws_s3_bucket.variable_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "variable_bucket" {
  bucket = aws_s3_bucket.variable_bucket.id
  acl    = "private"
}




resource "aws_dynamodb_table" "tf_lock" {
  name         = var.dynamo_db_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
