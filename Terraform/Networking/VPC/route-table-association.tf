resource "aws_route_table_association" "subnets_associations" {
  for_each = var.route_table_association_map

  subnet_id      =  lookup(
      { for key, value in aws_subnet.subnet : value.tags["Name"] => value.id },
      each.value.subnet_name,
      null
    )

  route_table_id =  lookup(
      { for key, value in aws_route_table.route_table : value.tags["Name"] => value.id },
      each.value.route_table_name,
      null
    )
}
