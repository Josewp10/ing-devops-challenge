resource "aws_cloudwatch_log_group" "logs" {
    name = "/amazon-ecs/${var.aws_cloudwatch_log_group_name}/log"
    retention_in_days = 3  
}