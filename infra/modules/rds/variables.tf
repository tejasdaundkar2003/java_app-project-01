variable "vpc_id" {
  description = "The VPC ID to use for the RDS instance"
  type        = string
}

variable "subnet_ids" {
  description = "The list of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "db_username" {
  description = "The username for the database"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  default     = "password"
}
