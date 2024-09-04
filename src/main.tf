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
}

module "vpc" {
  source = "./VPC"
  vpc_name = var.vpc_name
}