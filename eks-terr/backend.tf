# Backend Block

terraform {
  backend "s3" {
    bucket = "vikash-bucket-terraform"
    key    = "eks/terraform.tfstate"
    region = "us-east-1"
  }
}
