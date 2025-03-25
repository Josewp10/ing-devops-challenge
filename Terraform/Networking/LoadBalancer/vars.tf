
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

variable "lb_target_group_map" {
  type = map(object({
    name = string
    port = number
    protocol = string
    vpc_name = string
     target_type = string
     health_check_path = string
  }))
}
/*
variable "aws_lb_target_group_attachment_map" {
  type = map(object({
    target_group_arn=string
    target_id=string
    port=number
  }))
}
variable "lb_listener_map" {
  type = map(object({
    lb_arn = string
    protocol = string
    port = string
    target_group_arn =string
    type = string
  }))
  default = { }
}
*/
variable "vpc_map" {
  description = "A map of SGs"
  type        = map(any)
}

variable "sg_map" {
  description = "A map of SGs"
  type        = map(any)
}

variable "subnets_map" {
  description = "A map of subnets"
  type        = map(any)
}