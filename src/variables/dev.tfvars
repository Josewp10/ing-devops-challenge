aws_region= "us-east-1"
aws_account_id= "308516746479"
vpc_name= "finaktiva-vpc"
vpc_sg_name="finaktiva-sg"
vpc_availability_zones= ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d", "us-east-1e", "us-east-1f"]
ecr_private_repo_name= "finaktiva"
ecs_cluster_name= "finaktiva-cluster"
ecs_task_execution_role_name="finaktiva-ecs-task-execution-role"
ecs_task_role_name = "finaktiva-ecs-task-role"
ecs_service_role_name= "finaktiva-ecs-service-role-dev"
aws_elb_name="finaktiva-dev-elb"
/*ecs_task_definition = {
    
}*/