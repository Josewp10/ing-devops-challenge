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
}

module "ecs" {
  source = "./ECS"
  ecs_cluster_name = var.ecs_cluster_name
  ecs_task_execution_role_name = var.ecs_task_execution_role_name
  ecs_task_role_name = var.ecs_task_role_name    
  aws_region = var.aws_region
  aws_account_id = var.aws_account_id
}