resource "aws_ecs_task_definition" "webserver" {
  family                   = "webserver"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "3072"
  
  runtime_platform {
    cpu_architecture        = "X86_64"
    operating_system_family = "LINUX"
  }

  container_definitions = jsonencode([
    {
      name        = var.aws_ecs_container_one_name
      image       = "${var.aws_ecr_repository_url}:${var.container_one_tag}"
      cpu         = 0
      essential   = true
      portMappings = [
        {
          name          = "http3001"
          containerPort = 3001
          hostPort      = 3001
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]
      logConfiguration = var.aws_task_definition_logs_configuration
    }/*,
    {
      name        = var.aws_ecs_container_two_name
      image       = "${var.aws_ecr_repository_url}:${var.container_two_tag}"
      cpu         = 0
      essential   = true
      portMappings = [
        {
          name          = "3002"
          containerPort = 3002
          hostPort      = 3002
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]
      logConfiguration = var.aws_task_definition_logs_configuration
    }*/
  ])

  tags = {}
}
