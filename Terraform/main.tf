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
  vpc_map = var.vpc_map
  subnets_map = var.subnets_map
  route_table_map = var.route_table_map
  route_table_association_map = var.route_table_association_map
  internet_gw_map = var.internet_gw_map
}

module "sg" {
  source = "./Networking/SecurityGroups"
  security_group_map = var.security_group_map
  vpc_map = module.vpc.vpc_map
  security_group_rule_map =  var.security_group_rule_map 
}
