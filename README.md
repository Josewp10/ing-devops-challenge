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

```
terraform init

terraform workspace list 

terraform workspace new environment_name //If the workspace does not exist

terraform workspace select environment_name

terraform plan -var-file="variables/environment_name.tfvars"

terraform apply --auto-aprove -var-file="variables/environment_name.tfvars"
```
