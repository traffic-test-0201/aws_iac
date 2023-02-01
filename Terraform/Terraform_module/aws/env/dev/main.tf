
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


data "aws_caller_identity" "this" {}


module "vpc" {
  source  = "../../modules/vpc"
}

module "alb" {
  source  = "../../modules/alb"
  security_groups = var.alb_sg_id
  vpc_id = module.vpc-env.vpc_id
}

