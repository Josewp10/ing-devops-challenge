/*variable "aws_vpc_id" { }
variable "aws_private_subnet_id" {}
variable "aws_public_subnet_id" {}
variable "aws_sg_id" {}

variable "aws_elb_name" {}

variable "aws_elb_type" {
  type = string
  default = "application"
}*/

variable "lb_map" {
  type = map(object({
    name = string,
    internal=bool
    type = string,
    security_group_names= list(string)
    subnet_names = list(string)
    enable_deletion_protection = bool
    drop_invalid_header_fields = bool
}))
  default = {}
}

variable "sg_map" {
  description = "A map of SGs"
  type        = map(any)
}

variable "subnets_map" {
  description = "A map of subnets"
  type        = map(any)
}