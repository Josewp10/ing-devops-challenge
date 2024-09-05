variable "vpc_name" { }
variable "vpc_sg_name" {}
variable "vpc_availability_zones" {}

variable "vpc_cidr" {
  type = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type = string
  default = "10.0.16.0/20"
}

variable "private_subnet_cidr" {
  type = string
  default = "10.0.128.0/20"
}

variable "internet_gw_cidr" {
  type = string
  default = "0.0.0.0/0"
}

variable "sg_cidr" {
  type = string
  default = "0.0.0.0/0"
}