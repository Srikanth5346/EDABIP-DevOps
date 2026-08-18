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

module "alb" {
  source = "./modules/alb"

  project_name          = "EDABIP"
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  public_subnet_ids     = module.vpc.public_subnet_ids
  alb_security_group_id = module.security_groups.alb_security_group_id
}

module "ecs" {
  source = "./modules/ecs"

  project_name = "EDABIP"
  environment  = var.environment

  backend_image  = "${module.ecr.backend_repository_url}:dev"
  frontend_image = "${module.ecr.frontend_repository_url}:dev"

  backend_port  = 5000
  frontend_port = 3000

  db_host     = module.rds.rds_endpoint
  db_port     = 3306
  db_name     = var.db_name
  db_username = var.db_username

  private_subnet_ids        = module.vpc.private_subnet_ids
  app_security_group_id     = module.security_groups.app_security_group_id
  frontend_target_group_arn = module.alb.frontend_target_group_arn
  backend_target_group_arn  = module.alb.backend_target_group_arn
}