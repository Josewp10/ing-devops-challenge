aws_region= "us-east-2"
aws_account_id= "308516746479"

/////////// VPC ///////////
vpc_name= "finaktiva-vpc"
vpc_sg_name="finaktiva-sg"
vpc_availability_zones= ["us-east-2a", "us-east-2b", "us-east-2c", "us-east-2d", "us-east-2e", "us-east-2f"]

/////////// ECR //////////////
ecr_private_repo_name= "finaktiva-stg"

////// Load Balancer /////////7
aws_elb_name="finaktiva-elb-stg"

//////// ECS ///////////////
ecs_cluster_name= "finaktiva-cluster-stg"
ecs_task_execution_role_name="finaktiva-ecs-task-execution-role-stg"
ecs_task_role_name = "finaktiva-ecs-task-role-stg"
ecs_service_role_name= "finaktiva-ecs-service-role-stg"
container_one_tag="stgops-udem"
container_two_tag="stgops-udem-2"
aws_task_definition_logs_configuration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "/amazon-ecs/container_logs/log"
          "awslogs-region"        = "us-east-2"
          "awslogs-stream-prefix" = "ecs"
          "mode"                  = "non-blocking"
          "awslogs-create-group"  = "true"
          "max-buffer-size"       = "25m"
        }
}

