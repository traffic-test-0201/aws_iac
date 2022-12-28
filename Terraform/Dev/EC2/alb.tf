#alb 생성
resource "aws_lb" "terraform-alb" {
    idle_timeout    = 60
    internal        = false
    name            = "terraform-alb"
    load_balancer_type = "application"
    security_groups = [aws_security_group.alb-ecs_sg.id]
    subnets         = [aws_subnet.terraform-subnet-public1-ap-northeast-2.id, aws_subnet.terraform-subnet-public2-ap-northeast-2.id]
    depends_on = [aws_lb_target_group.tg-ecs]
    enable_deletion_protection = false

}

#타겟 그룹 생성
resource "aws_lb_target_group" "tg-ecs" {
  name     = "tg-ecs"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.traffic-vpc.id}"
  health_check {
  interval            = 30
  path                = "/index.html"
  healthy_threshold   = 3
  unhealthy_threshold = 3
  }
}

# 리스너 생성 -> ecs에서 생성하므로 주석처리
# resource "aws_lb_listener" "alb-listener" {
#   load_balancer_arn = aws_lb.terraform-alb.arn
#   port              = 80
#   protocol          = "HTTP"

#   default_action {
#     type             = "forward"
#     target_group_arn = "${aws_lb_target_group.tg-ecs.arn}"
#   }
# }
