# OUTPUTS BLOCK

# VPC block

output "vpc_id" {
  value = module.vpc.vpc_id
}

output "azs" {
  value = var.azs
}


# EKS output

output "cluster_name" {
  value = module.eks.cluster_name
}

output "cluster_id" {
  value = module.eks.cluster_id
}

