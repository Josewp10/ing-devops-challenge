resource "aws_lb_listener" "lb_listener" {
  for_each = var.lb_listener_map
  load_balancer_arn = lookup(
    { for key, value in aws_lb.aws_elb : value.name => value.arn },
    each.value.lb_name,
    null
  )
  port              = each.value.port
  protocol          = each.value.protocol

  default_action {
    type = each.value.acction_type
    target_group_arn = lookup(
    { for key, value in aws_lb_target_group.target_group : value.name => value.arn },
    each.value.target_group_name,
    null
  )
  }
}