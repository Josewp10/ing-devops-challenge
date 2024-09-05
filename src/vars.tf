variable "aws_region" {
    type = string
    default = null
}

variable "aws_account_id" {
  type = string
  default = null
}

variable "vpc_name" {
  type = string
  default = "vpc"
}

variable "vpc_sg_name" {
  type = string
  default = "vpc"
}

variable "vpc_availability_zones" {
  type = list(string)
  default = null
}

variable "ecr_private_repo_name" {
  type = string
  default = "ecr-repo"
}

variable "ecs_cluster_name" {
    type = string
    default = "ecs_cluster"
}

variable "ecs_task_execution_role_name" {
    type = string
    default = "ecs_task_execution_role"
}

variable "ecs_task_role_name" {
    type = string
    default = "ecs_task_execution_role"
}

variable "ecs_service_role_name" {
    type = string
    default = "ecs_task_execution_role"
}

variable "aws_elb_name" {
  type = string
  default = "project-elb"
}

variable "aws_task_definition_logs_configuration" {
  type = object({
    logDriver = string
    options   = map(string)
  })
}
