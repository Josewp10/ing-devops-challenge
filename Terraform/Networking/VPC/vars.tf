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

