# Backend Block

terraform {
  backend "s3" {
    bucket = "xxxx-xxx-xxx"  # Replace with your bucket here
    key    = "jenkins/terraform.tfstate"
    region = "us-east-1"
  }
}
