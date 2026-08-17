variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

resource "aws_ecr_repository" "frontend" {
  name                 = "${lower(var.project_name)}-${var.environment}-frontend"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-frontend-ecr"
  }
}

resource "aws_ecr_repository" "backend" {
  name                 = "${lower(var.project_name)}-${var.environment}-backend"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-backend-ecr"
  }
}

output "frontend_repository_url" {
  value = aws_ecr_repository.frontend.repository_url
}

output "backend_repository_url" {
  value = aws_ecr_repository.backend.repository_url
}