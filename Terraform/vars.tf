variable "aws_region" {
    type = string
    default = null
}

variable "aws_account_id" {
  type = string
  default = null
}

variable "vpc_name" {
  type = string
  default = "vpc"
}

variable "subnets_map" {
  type = map(object({
    name = string,
    cidr = string,
    az = string
}))
  default = {}
  
}

variable "subnets_association_list" {
  type = list(string)
  description = "List of subnet names to associate with the route table"
}