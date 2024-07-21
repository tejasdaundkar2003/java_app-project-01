variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
  default     = "my-cluster"
}

variable "vpc_id" {
  description = "The VPC ID to use for the EKS cluster"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the EKS cluster"
  type        = list(string)
}

variable "iam_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}
