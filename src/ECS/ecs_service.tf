resource "aws_ecs_service" "ecs_service_webserver" {
  name            = "ecs_service_webserver"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.webserver.arn
  desired_count   = 1
  launch_type = "FARGATE"

  network_configuration {
      subnets = [ var.aws_public_subnet_id ]
      security_groups = [ var.aws_sg_id ]
  }

  load_balancer {
    target_group_arn = var.aws_elb_target_group_arn
    container_name   = var.aws_ecs_container_name
    container_port   = 80
  }

  depends_on = [var.aws_elb_listener]

}