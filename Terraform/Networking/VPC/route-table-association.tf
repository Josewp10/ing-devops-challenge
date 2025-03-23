resource "aws_route_table_association" "subnets_associations" {
  for_each = { 
    for key, value in aws_subnet.subnet : key => value.id 
    if contains(var.subnets_association_list, key)
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.route_table.id
}
