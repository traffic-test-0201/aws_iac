resource "aws_lb" "terraform-alb" {
    idle_timeout    = 60
    internal        = false
    name            = "terraform-alb"
    load_balancer_type = "application"
    security_groups = [aws_security_group.publicweb.id, aws_security_group.db-security.id ]
    subnets         = [aws_subnet.subnet-terraform-vpc-subnet-public2-us-west-1b.id, aws_subnet.subnet-terraform-vpc-subnet-public1-us-west-1c.id]

    enable_deletion_protection = false

}

#타겟 그룹 생성
resource "aws_lb_target_group" "tg-terraform2" {
  name     = "tg-terraform2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${aws_vpc.terraform-vpc-vpc.id}"
  health_check {
  interval            = 30
  path                = "/index.html"
  healthy_threshold   = 3
  unhealthy_threshold = 3
  }
}


resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.terraform-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.tg-terraform2.arn}"
  }
}
