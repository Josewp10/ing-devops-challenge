resource "aws_route_table" "route_table" {
  for_each = var.route_table_map

  vpc_id = lookup(
    { for key, value in aws_vpc.vpc : value.tags["Name"] => value.id },
    each.value.vpc_name,
    null
  )

  route {
    gateway_id = lookup(
      { for key, value in aws_internet_gateway.gw : value.tags["Name"] => value.id },
      each.value.igw_name,
      null
    )
    cidr_block = "0.0.0.0/0"
  }

  tags = {
    Name = each.value.route_table_name
  }
}

