resource "aws_lb_target_group" "target_group" {
  name     = "${var.aws_elb_name}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_vpc_id
  target_type = "ip"
}