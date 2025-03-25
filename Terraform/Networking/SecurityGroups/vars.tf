variable "security_group_map" {
  type = map(object({
    name = string,
    description = string,
    vpc_name = string
}))
  default = {}
}

variable "vpc_map" {
  description = "A map of VPCs"
  type        = map(any)
}

variable "security_group_rule_map" {
  type = map(object({
    security_group_name = string,
    type=string
    cidr_blocks = list(string),
    from_port = number
    to_port = number
    protocol = string
}))
  default = {}
}