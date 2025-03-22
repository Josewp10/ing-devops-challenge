export AWS_PROFILE=marketplace-imagineapps

terraform init

terraform plan -var-file="variables/environment.tfvars"

terraform apply --auto-approve -var-file="variables/environment.tfvars"