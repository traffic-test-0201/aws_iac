output "account_id" {
  description = "The Aws Account ID"
  value = data.aws_caller_identity.this.account_id
}

output "vpc_id" {
  value = module.vpc-env.vpc_id
}

output "alb_sg_id" {
  value = aws_security_group.alb-ecs_sg.id
}