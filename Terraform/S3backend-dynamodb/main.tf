# This example will work with terraform 12 and higher
terraform {
  required_version = ">= 0.14.9"
}

provider "aws" {
  region = "ap-northeast-2"
}

resource "aws_s3_bucket" "variable_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
  }
}

