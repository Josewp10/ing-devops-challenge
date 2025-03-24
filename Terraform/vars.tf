variable "aws_region" {
    type = string
    default = null
}

variable "aws_account_id" {
  type = string
  default = null
}

variable "vpc_map" {
  type = map(object({
    name = string,
    cidr = string
}))
  default = {}
}

variable "subnets_map" {
  type = map(object({
    name = string,
    vpc_name=string,
    cidr = string,
    az = string
}))
  default = {}
  
}

variable "internet_gw_map" {
  type = map(object({
    name=string,
    vpc_name=string
}))
  default = {}
}

variable "route_table_map" {
  type = map(object({
    vpc_name=string,
    route_table_name=string,
    igw_name=string
}))
  default = {}
}

variable "route_table_association_map" {
  type = map(object({
    subnet_name=string,
    route_table_name=string
}))
  default = {}
}

variable "security_group_map" {
  type = map(object({
    name = string,
    description = string,
    vpc_name = string
}))
  default = {}
}