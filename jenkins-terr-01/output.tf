# OutPut Block

# VPC Output Block

output "vpc_id" {
  description = "VPC id"
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "CIDR Output"
  value       = module.vpc.vpc_cidr_block
}

output "public_subnets" {
  description = "Public Subnet"
  value       = module.vpc.public_subnets
}

output "azs" {
  description = "A list of availability zones spefified as argument to this module"
  value       = module.vpc.azs
}

# Security Group Ids

output "security_group_id" {
  description = "Security Group ids"
  value       = module.sg.security_group_id
}


# EC2 Output Block

output "public_ip" {
  description = "Public IP"
  value       = module.ec2_instance.public_ip
}

