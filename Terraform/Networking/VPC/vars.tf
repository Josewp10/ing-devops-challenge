variable "vpc_name" { }

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "subnets_map" {
  type = map(object({
    name = string,
    cidr = string,
    az = string
}))
  default = {}
}

variable "internet_gw_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "subnets_association_list" {
  type = list(string)
  description = "List of subnet names to associate with the route table"
}
