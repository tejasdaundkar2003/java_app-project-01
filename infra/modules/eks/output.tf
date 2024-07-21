output "cluster_name" {
  value = aws_eks_cluster.default.name
}

output "iam_role_arn" {
  value = aws_iam_role.eks.arn
}
