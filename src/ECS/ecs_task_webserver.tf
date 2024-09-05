resource "aws_ecs_task_definition" "webserver" {
  family                   = "webserver"
  execution_role_arn       = "arn:aws:iam::308516746479:role/ecsTaskExecutionRole"
  task_role_arn            = "arn:aws:iam::308516746479:role/ecsTaskExecutionRole"
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
      image       = "308516746479.dkr.ecr.us-east-1.amazonaws.com/devops-udem:latest"
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

  lifecycle {
    ignore_changes = [
      container_definitions
    ]
  }
}
