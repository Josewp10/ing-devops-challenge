terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "finaktiva-terraform"
    key = "terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}

module "ecr" {
  source = "./ECR"
  ecr_private_repo_name = var.ecr_private_repo_name
}

module "vpc" {
  source = "./VPC"
  vpc_name = var.vpc_name
  vpc_sg_name = var.vpc_sg_name
  vpc_availability_zones = var.vpc_availability_zones
}

module "cloudwatch" {
  source = "./cloudwatch"
}

module "ecs" {
  source = "./ECS"
  ecs_cluster_name = var.ecs_cluster_name
  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  aws_task_definition_logs_configuration = var.aws_task_definition_logs_configuration
  ecs_task_role_name = var.ecs_task_role_name
  ecs_service_role_name = var.ecs_service_role_name
  ecs_service_webserver_role = var.ecs_service_webserver_role
  container_one_tag = var.container_one_tag
  container_two_tag = var.container_two_tag

  aws_vpc_id = module.vpc.vpc_id
  aws_private_subnet_id = module.vpc.private_subnet_id
  aws_public_subnet_id = module.vpc.public_subnet_id
  aws_sg_id = module.vpc.ecs_sg_id

  aws_elb_arn = module.elb.aws_elb_arn
  aws_elb_target_group_arn = module.elb.aws_elb_target_group_arn
  aws_elb_listener = module.elb.aws_elb_listener

  aws_ecr_repository_url = module.ecr.aws_ecr_repository_url
  aws_region = var.aws_region
  aws_account_id = var.aws_account_id
  aws_cloudwatch_log_group = module.cloudwatch.aws_cloudwatch_log_group
}

module "elb" {
  source = "./LoadBalancer"
  aws_elb_name = var.aws_elb_name

  aws_vpc_id = module.vpc.vpc_id
  aws_private_subnet_id = module.vpc.private_subnet_id
  aws_public_subnet_id = module.vpc.public_subnet_id
  aws_sg_id = module.vpc.load_balancer_sg_id
}