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
  region  = "ap-northeast-2"
}

resource "aws_s3_bucket" "backend_bucket" {
  bucket = "Traffic-Backend-s3bucket"
  versioning {
    enabled = true
  }
}

#여러 사람들과 테라폼소스 코딩을 할때 같은 리소스를 동시에 생성하는 이슈를 dynamoDB로 제어
resource "aws_dynamodb_table" "tf_lock" {
  name         = var.dynamo_db_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}