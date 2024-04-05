# Region Block

variable "aws_region" {
  description = "Providing default region"
  type        = string
}

# VPC Block

variable "vpc_cidr" {
  description = "Providing CIDR range"
  type        = string
}

variable "azs" {
  description = "Providing availability zones"
  type        = list(string)
}

variable "public_subnets" {
  description = "Providing public subnet range"
  type        = list(string)
}

variable "private_subnets" {
  description = "Providing private subnet range"
  type        = list(string)
}
