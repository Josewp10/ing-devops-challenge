resource "aws_lb" "aws_project_elb" {
  name               = var.aws_elb_name
  internal           = false
  load_balancer_type = var.aws_elb_type
  security_groups    = [ var.aws_sg_id ]
  subnets            = [ var.aws_public_subnet_id, var.aws_private_subnet_id ]

  enable_deletion_protection = false
  drop_invalid_header_fields = true

}