output "aws_elb_arn" {
  value = aws_lb.aws_project_elb.arn
}

output "aws_elb_target_group_arn" {
  value = aws_lb_target_group.target_group.arn
}