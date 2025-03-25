resource "aws_lb" "aws_elb" {
  for_each = var.lb_map

  name               = each.value.name
  internal           = each.value.internal
  load_balancer_type = each.value.type
  security_groups    =  flatten([
          for sg_name in each.value.security_group_names : 
          lookup({ for key, value in var.sg_map : value.name => value.id }, sg_name, null)
        ])
  subnets            = flatten([
          for sg_name in each.value.subnet_names : 
          lookup({ for key, value in var.subnets_map : value.tags["Name"]  => value.id }, sg_name, null)
        ])

  enable_deletion_protection = each.value.enable_deletion_protection
  drop_invalid_header_fields = each.value.drop_invalid_header_fields

}