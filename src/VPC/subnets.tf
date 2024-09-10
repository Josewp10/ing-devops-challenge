resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.vpc_availability_zones[0]

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_subnet" "public_subnet_a" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_a_cidr
  availability_zone = var.vpc_availability_zones[1]

  tags = {
    Name = "public_subnet_a"
  }
}

resource "aws_subnet" "public_subnet_b" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.public_subnet_b_cidr
  availability_zone = var.vpc_availability_zones[2]

  tags = {
    Name = "public_subnet_b"
  }
}