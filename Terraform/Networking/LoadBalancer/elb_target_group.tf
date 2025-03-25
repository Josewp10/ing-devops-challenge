resource "aws_lb_target_group" "target_group" {
  for_each = var.lb_target_group_map
  name     = each.value.name
  port     = each.value.port
  protocol = each.value.protocol
  vpc_id   = lookup(
              { for key, value in var.vpc_map : value.tags["Name"] => value.id },
              each.value.vpc_name,
              null
            )

  target_type = each.value.target_type
  deregistration_delay = 0

  health_check {
    enabled = true
    healthy_threshold = 3
    interval = 10
    matcher = 200
    path = each.value.health_check_path
    port = each.value.port
    protocol = each.value.protocol
    timeout = 3
    unhealthy_threshold = 2
  }
  tags = {
    Name = each.value.name
  }
}