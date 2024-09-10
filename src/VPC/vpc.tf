resource "aws_vpc" "vpc" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  # Enable DNS support (DNS resolution)
  enable_dns_support = true

  # Enable DNS hostnames
  enable_dns_hostnames = true
  
  tags = {
    Name = var.vpc_name
  }
}
