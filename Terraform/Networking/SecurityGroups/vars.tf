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
