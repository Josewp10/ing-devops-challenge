output "vpc_map_out" {
  value = { for key, val in aws_vpc.vpc : key => val }
}

output "subnet_map_out" {
  description = "The IDs of all subnets"
  value = { for key, val in aws_subnet.subnet : key => val }
}