variable "aws_vpc_id" { }
variable "aws_private_subnet_id" {}
variable "aws_public_subnet_id" {}
variable "aws_sg_id" {}

variable "aws_elb_name" {}

variable "aws_elb_type" {
  type = string
  default = "application"
}