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

# resource "aws_s3_bucket" "backend_bucket" {
#   bucket = "Traffic-Backend-s3bucket"
#   versioning {
#     enabled = true
#   }
# }
