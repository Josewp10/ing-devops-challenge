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
  vpc_map = module.vpc.vpc_map_out
  security_group_rule_map =  var.security_group_rule_map 
}

module "lb" {
  source = "./Networking/LoadBalancer"
  lb_map = var.lb_map
  sg_map = module.sg.sg_map_out
  subnets_map = module.vpc.subnet_map_out
  lb_target_group_map = var.lb_target_group_map
  vpc_map = module.vpc.vpc_map_out
}
