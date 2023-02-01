output "vpc_id" {
  value = aws_vpc.traffic-vpc.id
}

output "alb_sg_id" {
  value = aws_security_group.alb-ecs_sg.id
}

