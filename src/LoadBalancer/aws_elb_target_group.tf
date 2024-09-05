resource "aws_lb_target_group" "target_group" {
  name     = "${var.aws_elb_name}-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.aws_vpc_id
  target_type = "ip"
  deregistration_delay = 0

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 10
    matcher = 200
    path = "/"
    port = "traffic-port"
    protocol = "HTTP"
    timeout = 3
    unhealthy_threshold = 2
  }
}