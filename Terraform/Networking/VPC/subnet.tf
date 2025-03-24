resource "aws_subnet" "subnet" {
  for_each = var.subnets_map
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  vpc_id     = lookup(
    { for key, value in aws_vpc.vpc : value.tags["Name"] => value.id },
    each.value.vpc_name,
    null
  )

  tags = {
    Name = each.value.name
  }
}


