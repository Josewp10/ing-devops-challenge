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

variable "route_table_map" {
  type = map(object({
    vpc_name=string,
    route_table_name=string,
    igw_name=string
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


variable "route_table_association_map" {
  type = map(object({
    subnet_name=string,
    route_table_name=string
}))
  default = {}
}

/*
variable "subnets_association_list" {
  type = list(string)
  description = "List of subnet names to associate with the route table"
}*/
