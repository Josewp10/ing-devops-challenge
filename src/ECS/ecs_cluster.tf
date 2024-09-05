resource "aws_ecs_cluster" "ecs_cluster" {
  name = var.ecs_cluster_name

  configuration {
   execute_command_configuration {
    logging = "OVERRIDE" 
    log_configuration {
      cloud_watch_encryption_enabled = true
      cloud_watch_log_group_name = var.aws_cloudwatch_log_group.name
    }
   } 
  }
  setting {
    name = "containerInsights"
    value = "enabled"
  }
}