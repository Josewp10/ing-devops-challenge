resource "aws_lb_listener" "webserver" {
  load_balancer_arn = aws_lb.aws_project_elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.target_group.arn
  }
}