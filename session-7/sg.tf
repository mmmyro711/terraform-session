// 2 Security Group:
// - Application load Balancer
// - EC2 Intance
resource "aws_security_group" "ec2" {
  name        = replace(local.name, "rtype", "ec2_sg")
  description = "this is a security group for ec2 instance"
  vpc_id      = aws_default_vpc.main.id
  tags = merge(
    { Name = replace(local.name, "rtype", "ec2-sg") },
    local.common_tags
  )

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ec2_ports
    iterator = dynamic
    content {
      from_port   = dynamic.value.port
      to_port     = dynamic.value.port
      protocol    = dynamic.value.protocol
      security_groups = [aws_security_group.alb.id]
    }
  }
}

resource "aws_security_group" "alb" {
  name        = replace(local.name, "rtype", "alb_sg")
  description = "this is a security group for alb"
  vpc_id      = aws_default_vpc.main.id
  tags = merge(
    { Name = replace(local.name, "rtype", "alb-sg") },
    local.common_tags
  )

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.alb
    iterator = dynamic
    content {
      from_port   = dynamic.value.port
      to_port     = dynamic.value.port
      protocol    = dynamic.value.protocol
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}
