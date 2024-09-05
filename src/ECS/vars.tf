variable "aws_region" {}
variable "aws_account_id" {}
variable "aws_cloudwatch_log_group" {}
variable "ecs_cluster_name" {}
variable "ecs_task_execution_role_name" {}
variable "ecs_task_role_name" {}
variable "ecs_service_role_name" {}
variable "aws_vpc_id" { }
variable "aws_private_subnet_id" {}
variable "aws_public_subnet_id" {}
variable "aws_sg_id" {}
variable "aws_elb_arn" {}
variable "aws_elb_target_group_arn" {}
variable "aws_elb_listener" {}
variable "aws_ecr_repository_url" {}
variable "aws_ecs_container_one_name" {
  type = string
  default = "ecs_container_one"
}
variable "aws_ecs_container_two_name" {
  type = string
  default = "ecs_container_two"
}
variable aws_task_definition_logs_configuration{}
variable "container_one_tag" {}
variable "container_two_tag" {}
variable ecs_service_webserver_role{}