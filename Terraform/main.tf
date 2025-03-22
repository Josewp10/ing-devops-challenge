terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region = var.aws_region
}


module "vpc" {
  source = "./Networking/VPC"
  vpc_name = var.vpc_name
  subnets_map = var.subnets_map
}