provider "aws" {
  region = "us-west-2"  # Change to your preferred region
}

module "vpc" {
  source = "./vpc"

  cidr_block           = "10.0.0.0/16"
  public_subnet_cidr   = "10.0.1.0/24"
  private_subnet_cidr  = "10.0.2.0/24"
}

module "iam" {
  source = "./iam"
}

module "eks" {
  source = "./eks"

  vpc_id           = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_id
  private_subnet_id = module.vpc.private_subnet_id
  role_arn          = module.iam.eks_role_arn
  node_role_arn     = module.iam.eks_node_role_arn
}

module "rds" {
  source = "./rds"

  vpc_id         = module.vpc.vpc_id
  private_subnet = module.vpc.private_subnet_id
  db_sg_id       = module.vpc.db_sg_id
  subnet_group   = module.vpc.private_subnet_id
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "cluster_name" {
  value = module.eks.cluster_name
}

output "db_endpoint" {
  value = module.rds.db_endpoint
}
