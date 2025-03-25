output "vpc_map" {
  value = { for key, val in aws_vpc.vpc : key => val }
}

output "subnet_map" {
  description = "The IDs of all subnets"
  value = { for key, val in aws_subnet.subnet : key => val }
}