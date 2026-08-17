variable "aws_region" {
  description = "AWS region for EDABIP infrastructure"
  type        = string
  default     = "ap-south-1"
}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
}

variable "db_name" {
  description = "EDABIP database name"
  type        = string
  default     = "edabip"
}

variable "db_username" {
  description = "EDABIP database username"
  type        = string
  default     = "edabipadmin"
}

variable "db_password" {
  description = "EDABIP database password"
  type        = string
  sensitive   = true
}

variable "db_instance_class" {
  description = "RDS instance class"
  type        = string
  default     = "db.t3.micro"
}

variable "db_allocated_storage" {
  description = "RDS allocated storage in GB"
  type        = number
  default     = 20
}