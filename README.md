# Ing DevOps Challenge

This project contains the solution to a challenge for the job vacancy under the position of devops engineer. The following is a description of its structure:

```
/
-- .github/ : CI/CD automation
-- challenge/ : Contains the challenge requirements and analysis process
-- src/ : Contains the source terraform code
```

**¿How to run terraform?**

Considerations:
1. The commands must be executed at src/ level
2. The following commands are expected to be used in a multi environment project
3. Replace environment_name with the name of the current environment
4. An AWS IAM user with permissions over the account is required to create the infrastructure

**AWS Configuration**
```
//Replace AWS_ACCES_KEY and AWS_SECRET_ACCES_KEY with the AWS IAM user credentials
aws configure set aws_access_key_id AWS_ACCES_KEY --region us-east-1       
aws configure set aws_secret_access_key AWS_SECRET_ACCES_KEY --region us-east-1
```

**Terraform commands**
```
terraform init

terraform workspace list 

terraform workspace new environment_name //If the workspace does not exist

terraform workspace select environment_name // A workspace helps to create resources un multiple regions

terraform plan -var-file="variables/environment_name.tfvars"

terraform apply --auto-aprove -var-file="variables/environment_name.tfvars"
```
