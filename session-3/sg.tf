resource "aws_security_group" "web" {
  name        = "web"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "web"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_http" {
  count = length( var.ports )    // 0, 1, 2 index
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = element( var.ports, count.index )         // range beetwen 80 and 80
  ip_protocol       = "tcp"
  to_port           = element( var.ports, count.index )        // range beetwen 80 and 80
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.web.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

// ** count = lenght(var.ports) given a list or map, the result is the number of elements in that collection. 
//              If given a string, the result is the number of characters in the string.
