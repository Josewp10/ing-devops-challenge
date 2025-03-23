resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.vpc.id

  route {
    gateway_id = aws_internet_gateway.gw.id
    cidr_block = var.internet_gw_cidr
  }

  tags = {
    Name = "${var.vpc_name}-rt"
  }
}

