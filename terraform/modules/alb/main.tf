resource "aws_lb" "this" {
  name               = "${lower(var.project_name)}-${var.environment}-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [var.alb_security_group_id]
  subnets         = var.public_subnet_ids

  tags = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

resource "aws_lb_target_group" "frontend" {
  name        = "${lower(var.project_name)}-${var.environment}-frontend-tg"
  port        = 3000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    enabled  = true
    protocol = "HTTP"
    path     = "/"
    port     = "3000"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-frontend-tg"
  }
}

resource "aws_lb_target_group" "backend" {
  name        = "${lower(var.project_name)}-${var.environment}-backend-tg"
  port        = 5000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    enabled  = true
    protocol = "HTTP"
    path     = "/"
    port     = "5000"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-backend-tg"
  }
}

resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}