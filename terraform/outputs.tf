output "vpc_id" {
  description = "EDABIP VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "EDABIP public subnet IDs"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "EDABIP private subnet IDs"
  value       = module.vpc.private_subnet_ids
}

output "alb_security_group_id" {
  description = "EDABIP ALB security group ID"
  value       = module.security_groups.alb_security_group_id
}

output "app_security_group_id" {
  description = "EDABIP application security group ID"
  value       = module.security_groups.app_security_group_id
}

output "rds_security_group_id" {
  description = "EDABIP RDS security group ID"
  value       = module.security_groups.rds_security_group_id
}

output "frontend_repository_url" {
  description = "EDABIP frontend ECR repository"
  value       = module.ecr.frontend_repository_url
}

output "backend_repository_url" {
  description = "EDABIP backend ECR repository"
  value       = module.ecr.backend_repository_url
}

output "rds_instance_id" {
  description = "EDABIP RDS instance ID"
  value       = module.rds.db_instance_id
}

output "rds_endpoint" {
  description = "EDABIP RDS endpoint"
  value       = module.rds.db_endpoint
}

output "rds_port" {
  description = "EDABIP RDS port"
  value       = module.rds.db_port
}

output "rds_database_name" {
  description = "EDABIP RDS database name"
  value       = module.rds.db_name
}