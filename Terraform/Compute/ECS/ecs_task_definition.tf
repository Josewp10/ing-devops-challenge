resource "aws_ecs_task_definition" "task_definition" {
  for_each = var.ecs_task_definition_map
  family                   = each.value.family
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  network_mode             = each.value.network_mode
  requires_compatibilities = each.value.requires_compatibilities
  cpu                      = each.value.cpu
  memory                   = each.value.memory
  
  runtime_platform {
    cpu_architecture        = each.value.cpu_architecture
    operating_system_family = each.value.operating_system_family
  }

  container_definitions = jsonencode([
    {
      name        = each.value.container_name
      image       = each.value.container_image
      cpu         = 0
      essential   = true
      portMappings = [
        {
          name          = each.value.container_port_name
          containerPort = each.value.container_port
          hostPort      = each.value.hostPort
          protocol      = each.value.protocol
          appProtocol   = each.value.appProtocol
        }
      ]
      //logConfiguration = var.aws_task_definition_logs_configuration
    }
  ])

  tags = {}
}
