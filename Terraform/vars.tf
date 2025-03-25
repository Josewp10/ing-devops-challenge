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

variable "lb_listener" {
  type = map(object({
    lb_arn = string
    protocol = string
    port = string
    target_group_arn =string
    type = string
  }))
  default = { }
}


variable "ecs_cluster_map" {
  type = map(object({
    name = string
  }))
}

variable "ecs_task_definition_map" {
  type = map(object({
    family = string
    network_mode = string
    requires_compatibilities = list(string)
    cpu = string
    memory = string
    cpu_architecture = string
    operating_system_family = string
    container_name= string
    container_image = string
    container_port_name = string
    container_port = number
    hostPort = number
    protocol =string
    appProtocol = string
  }))
}