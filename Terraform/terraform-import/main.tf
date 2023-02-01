terraform {

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.45"
    }
  }
  required_version = ">= 0.15"
}

provider "aws" {
  region = "ap-northeast-2"
}
