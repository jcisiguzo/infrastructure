# Target Group
resource "aws_lb_target_group" "alb_tg" {
  name     = var.tg_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
  path                = "/"
  protocol            = "HTTP"
  interval            = 30
  timeout             = 5
  healthy_threshold   = 2
  unhealthy_threshold = 2
}
}
resource "aws_lb_target_group_attachment" "alb_tga" {
  for_each = var.instance_ids # This fetchs the instances
  target_group_arn = aws_lb_target_group.alb_tg.arn
  target_id        = each.value # This refer to the instances id using loops
  port             = 80

  # depends_on = [ aws_lb_target_group.alb_tg ]
}
# Application Load Balancer
resource "aws_lb" "alb_lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = var.alb_type
  security_groups    = [var.sg_alb_id]
  subnets            = [
    var.subnet_1_id,
    var.subnet_2_id
  ] #correction
}
# ALB listener
resource "aws_lb_listener" "alb_lb_listner" {
  load_balancer_arn = aws_lb.alb_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_tg.arn
  }
}