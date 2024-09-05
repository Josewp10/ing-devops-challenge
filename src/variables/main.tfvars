aws_region= "us-west-2"
aws_account_id= "308516746479"

/////////// VPC ///////////
vpc_name= "finaktiva-vpc"
vpc_sg_name="finaktiva-sg"
vpc_availability_zones= ["us-west-2a", "us-west-2b", "us-west-2c", "us-west-2d", "us-west-2e", "us-west-2f"]

/////////// ECR //////////////
ecr_private_repo_name= "finaktiva-main"

////// Load Balancer /////////7
aws_elb_name="finaktiva-elb-main"

//////// ECS ///////////////
ecs_cluster_name= "finaktiva-cluster-main"
ecs_task_execution_role_name="finaktiva-ecs-task-execution-role-main"
ecs_task_role_name = "finaktiva-ecs-task-role-main"
ecs_service_role_name= "finaktiva-ecs-service-role-main"
ecs_service_webserver_role="finaktiva-ecs_service_webserver_role-main"
container_one_tag="mainops-udem"
container_two_tag="mainops-udem-2"
aws_task_definition_logs_configuration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/amazon-ecs/container_logs/log"
          "awslogs-region"        = "us-west-2"
          "awslogs-stream-prefix" = "ecs"
          "mode"                  = "non-blocking"
          "awslogs-create-group"  = "true"
          "max-buffer-size"       = "25m"
        }
}

