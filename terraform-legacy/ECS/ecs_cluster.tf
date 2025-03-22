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

resource "aws_ecs_cluster_capacity_providers" "cluster_capacity_providers" {
  cluster_name = aws_ecs_cluster.ecs_cluster.id

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE"
    weight            = 1
  }

  default_capacity_provider_strategy {
    capacity_provider = "FARGATE_SPOT"
    weight            = 1
  }
}
