module "vpc" {
  source = "./modules/vpc"

  project_name       = "EDABIP"
  environment        = var.environment
  vpc_cidr           = "10.0.0.0/16"
  availability_zones = ["ap-south-1a", "ap-south-1b"]
}

module "security_groups" {
  source = "./modules/security-groups"

  project_name = "EDABIP"
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
}

module "ecr" {
  source = "./modules/ecr"

  project_name = "EDABIP"
  environment  = var.environment
}

module "rds" {
  source = "./modules/rds"

  project_name      = "EDABIP"
  environment       = var.environment
  subnet_ids        = module.vpc.private_subnet_ids
  security_group_id = module.security_groups.rds_security_group_id

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  db_instance_class = var.db_instance_class
  allocated_storage = var.db_allocated_storage
}