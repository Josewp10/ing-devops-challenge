resource "aws_vpc" "vpc" {
  for_each = var.vpc_map
  cidr_block       = each.value.cidr
  instance_tenancy = "default"

  tags = {
    Name = each.value.name
  }
}
