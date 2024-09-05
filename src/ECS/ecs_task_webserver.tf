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
      name        = var.aws_ecs_container_name
      image       = "${var.aws_ecr_repository_url}:devops-udem"
      cpu         = 0
      essential   = true
      portMappings = [
        {
          name          = "80"
          containerPort = 80
          hostPort      = 80
          protocol      = "tcp"
          appProtocol   = "http"
        }
      ]
      logConfiguration = var.aws_task_definition_logs_configuration
    }
  ])

  tags = {}
}
