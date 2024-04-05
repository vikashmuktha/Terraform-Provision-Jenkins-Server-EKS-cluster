# var.aws_region
variable "aws_region" {
  description = "Providing Region"
  type        = string
}


# VPC Variables
variable "cidr" {
  description = "Providing cidr block"
  type        = string
}

variable "public_subnets" {
  description = "Providing Public Subnets"
  type        = list(string)
}

variable "azs" {
  description = "Providing availability zones"
  type        = list(string)
}

# Instances Keys
variable "key_name" {
  description = "Providing Instances Key Name"
  type        = string
}


# EC2 Block
variable "instance_type" {
  description = "Providing Instance type"
  type        = string
}