# Providers Block

terraform {
  required_version = "1.5.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.44"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
