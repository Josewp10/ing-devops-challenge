resource "aws_ecs_service" "ecs_service_webserver" {
  name            = "ecs_service_webserver"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.webserver.arn
  desired_count   = 1
  launch_type = "FARGATE"

  deployment_controller {
    type = "ECS"
  }

  network_configuration {
      subnets = [ var.aws_public_subnet_id ]
      security_groups = [ var.aws_sg_id ]
      assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.aws_elb_target_group_arn
    container_name   = var.aws_ecs_container_one_name
    container_port   = 3001
  }


  deployment_circuit_breaker {
    enable   = true
    rollback = true
  }

  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent         = 200

  enable_ecs_managed_tags = true
  propagate_tags          = "NONE"
  enable_execute_command  = false

  lifecycle {
    create_before_destroy = true
  }


}

/////////////// SERVICE ROLE
resource "aws_iam_role" "ecs_service_role" {
  name = "ecs_service_webserver_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action    = "sts:AssumeRole"
        Effect    = "Allow"
        Principal = {
          Service = "ecs.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "ecs_service_role_attachment" {
  role       = aws_iam_role.ecs_service_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
