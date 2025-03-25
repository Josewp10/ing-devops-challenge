resource "aws_security_group_rule" "sg_rule" {
  for_each = var.security_group_rule_map

  security_group_id = lookup({
    for key, value in aws_security_group.sg : value.name => value.id
  }, each.value.security_group_name, null)
  type = each.value.type
  cidr_blocks         = each.value.cidr_blocks
  from_port         = each.value.from_port
  protocol       = each.value.protocol
  to_port           = each.value.to_port
}

