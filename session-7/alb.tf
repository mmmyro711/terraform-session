resource "aws_lb_target_group" "main" {
  name     = replace(local.name, "rtype", "alb")
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_default_vpc.main.id
  target_type = "instance"
  tags = merge(
    { Name = replace(local.name, "rtype", "alb") },
    local.common_tags
  )
}
resource "aws_lb" "main" {
  name               = replace(local.name, "rtype", "alb")
  internal           = false   // internet facing
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = [aws_default_subnet.public_subnet_1.id, aws_default_subnet.public_subnet_2.id]

  tags = merge(
    { Name = replace(local.name, "rtype", "alb") },
    local.common_tags
  )
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  tags = merge(
    { Name = replace(local.name, "rtype", "alb-http") },
    local.common_tags
  )
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}
resource "aws_lb_listener" "https" {
  load_balancer_arn = aws_lb.main.arn
  port              = "433"
  protocol          = "HTTPS"
  tags = merge(
    { Name = replace(local.name, "rtype", "alb-https") },
    local.common_tags
  )
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}