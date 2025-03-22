aws_region= "us-east-1"
aws_account_id= "308516746479"

/////////// VPC ///////////
vpc_name= "finaktiva-vpc"
vpc_sg_name="finaktiva-sg"
vpc_availability_zones= ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]

/////////// ECR //////////////
ecr_private_repo_name= "finaktiva-dev"

////// Load Balancer /////////7
aws_elb_name="finaktiva-elb-dev"

//////// ECS ///////////////
ecs_cluster_name= "finaktiva-cluster-dev"
ecs_task_execution_role_name="finaktiva-ecs-task-execution-role-dev"
ecs_task_role_name = "finaktiva-ecs-task-role-dev"
ecs_service_role_name= "finaktiva-ecs-service-role-dev"
ecs_service_webserver_role="finaktiva-ecs_service_webserver_role-dev"
container_one_tag="devops-udem"
container_two_tag="devops-udem-2"
aws_task_definition_logs_configuration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/amazon-ecs/container_logs/log"
          "awslogs-region"        = "us-east-1"
          "awslogs-stream-prefix" = "ecs"
          "mode"                  = "non-blocking"
          "awslogs-create-group"  = "true"
          "max-buffer-size"       = "25m"
        }
}

