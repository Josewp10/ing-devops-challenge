resource "aws_subnet" "subnet" {
  for_each = var.subnets_map
  vpc_id     = aws_vpc.vpc.id
  cidr_block = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.name
  }
}


