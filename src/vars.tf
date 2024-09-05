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