output "vpc_id" {
  value = { for key, val in aws_vpc.vpc : key => val.id }
}

output "subnet_ids" {
  description = "The IDs of all subnets"
  value = { for key, val in aws_subnet.subnet : key => val.id }
}