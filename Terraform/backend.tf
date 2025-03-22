terraform {
  backend "s3" {
    bucket = "iac-practice-bucket"
    key = "terraform/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
  }
}
