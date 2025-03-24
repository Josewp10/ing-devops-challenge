resource "aws_internet_gateway" "gw" {
  for_each = var.internet_gw_map
  vpc_id = lookup(
    { for key, value in aws_vpc.vpc : value.tags["Name"] => value.id },
    each.value.vpc_name,
    null
  )

  tags = {
    Name = each.value.name
  }
}