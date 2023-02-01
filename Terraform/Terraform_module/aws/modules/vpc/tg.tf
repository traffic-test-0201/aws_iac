#resource "aws_lb_target_group" "tg-ecs" {
#  name     = "tg-ecs"
#  port     = 80
#  protocol = "HTTP"
#  vpc_id = aws_vpc.traffic-vpc.id
#  health_check {
#  interval            = 30
#  path                = "/index.html"
#  healthy_threshold   = 3
#  unhealthy_threshold = 3
#  depends_on = [aws_vpc.traffic-vpc]
#  }
#}
