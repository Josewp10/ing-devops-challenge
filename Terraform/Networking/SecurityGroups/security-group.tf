resource "aws_security_group" "sg" {
  for_each = var.security_group_map
  name        = each.value.name
  description = each.value.description
  vpc_id      = lookup(
              { for key, value in var.vpc_map : value.tags["Name"] => value.id },
              each.value.vpc_name,
              null
            )


  tags = {
    Name = each.value.name
  }
}
