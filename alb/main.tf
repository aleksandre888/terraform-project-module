resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = var.alb_type
  security_groups    = [var.alb_sg_id, var.default_sg_id]
  subnets            = var.public_subnets
  depends_on         = [var.vpc_id, var.default_sg_id]

  tags = {
    Name = var.alb_tag
  }
}

resource "aws_lb_listener" "alb_listener" {
  for_each          = var.alb_listeners
  load_balancer_arn = aws_lb.alb.arn
  port              = each.value.port
  protocol          = each.value.protocol
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

resource "aws_lb_target_group" "alb_target_group" {
  name       = var.target_group_name
  port       = var.target_group_port
  protocol   = var.target_group_protocol
  vpc_id     = var.vpc_id
  slow_start = var.target_group_slow_start

  health_check {
    path                = var.health_check_path
    interval            = var.health_check_interval
    timeout             = var.health_check_timeout
    healthy_threshold   = var.health_check_healthy_threshold
    unhealthy_threshold = var.health_check_unhealthy_threshold
  }

  tags = {
    Name = var.alb_target_group_tag
  }
}

resource "aws_lb_target_group_attachment" "alb_tg_attachment" {
  for_each = { for idx, instance in var.ec2_instances : idx => instance }
  target_group_arn = aws_lb_target_group.alb_target_group.arn
  target_id        = each.value.id
  port             = var.target_group_port
}
