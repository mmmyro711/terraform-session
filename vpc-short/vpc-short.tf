// Create vpc
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "short_vpc"
  }
}
 // Public subnets
resource "aws_subnet" "public" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_cidr_block, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "public-${count.index}"
  }
}
resource "aws_subnet" "private" {
  count             = 3
  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_cidr_block, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "private-${count.index}"
  }
}
// Route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public_rt"
  }
}
resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private_rt"
  }
}

// Public Subnet Association

resource "aws_route_table_association" "public" {
    count = 3
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}

// Private Subnet Association

resource "aws_route_table_association" "private" {
  count = 3
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = aws_route_table.private.id
}

