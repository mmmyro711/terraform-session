// 1* Create - VPC, 10.0.0.0/16
resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "task-vpc"
  }
}
// 2* Create -3 Public Subnets (10.0.1.0/24, 10.0.2.0/24, 10.0.3.0/24)  
//            3 Private Subnets (10.0.11.0/24, 10.0.12.0/24, 10.0.13.0/24)
resource "aws_subnet" "public-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a" 

  tags = {
    Name = "piblic-1"
  }
}
resource "aws_subnet" "piblic-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "piblic-2"
  }
}
resource "aws_subnet" "public-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "piblic-3"
  }
}
resource "aws_subnet" "private-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "private-1"
  }
}
resource "aws_subnet" "private-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private-2"
  }
}
resource "aws_subnet" "private-3" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.13.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "private-3"
  }
}
// Create 2 Route Tables
resource "aws_route_table" "public_rt" {
   vpc_id = aws_vpc.main.id
     tags = {
    Name = "public-rt"
  }
}
resource "aws_route_table" "private_rt" {
   vpc_id = aws_vpc.main.id
     tags = {
    Name = "private-rt"
  }
}
// Create Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "internet-gw"
  } 
}
// Create - Nat Gateway, Elastic IP
// Elastic IP
resource "aws_eip" "eip" {
    tags = {
    Name = "elastic-ip"
    }
}
// Nat Gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public-1.id

  tags = {
    Name = "gw NAT"
  }
}
// Create - Route Table Subnet Associations, Routes for Gateways
// Public Route Table Subnet Associations:
resource "aws_route_table_association" "public-rtsa1" {
  subnet_id      = aws_subnet.public-1.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-rtsa2" {
  subnet_id      = aws_subnet.public-2.id
  route_table_id = aws_route_table.public-rt.id
}
resource "aws_route_table_association" "public-rtsa3" {
  subnet_id      = aws_subnet.public-3.id
  route_table_id = aws_route_table.public-rt.id
}
// Private Route Table Subnet Associations:
resource "aws_route_table_association" "private-rtsa1" {
  subnet_id      = aws_subnet.private-1.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "private-rtsa2" {
  subnet_id      = aws_subnet.private-2.id
  route_table_id = aws_route_table.private-rt.id
}
resource "aws_route_table_association" "private-rtsa3" {
  subnet_id      = aws_subnet.private-3.id
  route_table_id = aws_route_table.private-rt.id
}
//Routes for Gateways
//Public:
resource "aws_route" "igw_route" {
  route_table_id            = aws_route_table.public-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id 
}
//Private:
resource "aws_route" "igw_route" {
  route_table_id            = aws_route_table.private-rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.gw.id 
}


