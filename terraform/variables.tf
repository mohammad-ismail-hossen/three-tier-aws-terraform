variable "aws_region" {
  description = "aws region"
  type        = string
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "db_username" {
  description = "Master username for rds db"
  type        = string
  default     = "dbadmin"
}

variable "db_password" {
  description = "Master password for rds db"
  type        = string
  sensitive   = true
}
