resource "aws_instance" "web" {
  ami           = "ami-0bb84b8ffd87024d8" // Data type is String, Hard Coded ""
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id] // Dynamic (Dont used "")

  tags = {
    Name = "terraform-session-instance-new"
  }
}

resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80  // range beetwen 80 and 80
  ip_protocol       = "tcp"
  to_port           = 80 // range beetwen 80 and 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

// How to Reference to Resource?
//  In order to Reference to Resource, we use lable (first and second)

// Syntax: first_label.second_label.attributte
// Attributes has 4 group (id, arn,owner_id, tag_id)
//