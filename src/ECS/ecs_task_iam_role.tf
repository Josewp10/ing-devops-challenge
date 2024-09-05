resource "aws_iam_role" "ecs_task_role" {
    name = "${var.ecs_task_role_name}-${var.aws_region}"
    assume_role_policy = jsonencode({
        "Version":"2012-10-17",
        "Statement":[
            {
                "Sid":"",
                "Effect":"Allow"
                "Principal": {
                    "Service":"ecs-tasks.amazonaws.com"
                },
                "Action":"sts:AssumeRole"
                "Condition":{
                    "ArnLike":{
                        "aws:SourceArn":"arn:aws:ecs:${var.aws_region}:${var.aws_account_id}:*"
                    },
                    "StringEquals":{
                        "aws:SourceAccount":"${var.aws_account_id}"
                    }
                }
            }
        ]
    })
  
}