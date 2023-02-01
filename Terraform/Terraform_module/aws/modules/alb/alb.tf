#alb 생성
resource "aws_lb" "terraform-alb" {
    idle_timeout    = 60
    internal        = false
    name            = "terraform-alb"
    load_balancer_type = "application"
    
    subnets         = [module.vpc-env.aws_subnet.terraform-subnet-public1-ap-northeast-2.id, module.vpc-env.aws_subnet.terraform-subnet-public2-ap-northeast-2.id]
    depends_on = [aws_lb_target_group.tg-ecs]
    enable_deletion_protection = false

}

# 리스너 생성 -> ecs에서 생성하므로 임시 주석처리

 resource "aws_lb_listener" "alb-listener" {
   load_balancer_arn = aws_lb.terraform-alb.arn
   port              = 80
   protocol          = "HTTP"

   default_action {
     type             = "forward"
     target_group_arn = "${aws_lb_target_group.tg-ecs.arn}"
   }
 }



