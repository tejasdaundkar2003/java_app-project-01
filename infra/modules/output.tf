# Output the VPC ID
output "vpc_id" {
  value = module.vpc.vpc_id
}

# Output the RDS Endpoint
output "rds_endpoint" {
  value = module.rds.endpoint
}

# Output the EKS Cluster Name
output "eks_cluster_name" {
  value = module.eks.cluster_name
}
