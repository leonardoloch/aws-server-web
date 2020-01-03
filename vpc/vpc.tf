resource "aws_vpc" "this" {
  cidr_block           = var.cidr_vpc
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.service}-vpc-${terraform.workspace}"
    env  = terraform.workspace
  }
}

### Subnets ###
resource "aws_subnet" "public_subnet_a" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.cidr_subnet_a
  map_public_ip_on_launch = "true"
  availability_zone       = var.availability_zone_a
  tags = {
    Name = "subnet-a-${terraform.workspace}"
    env  = terraform.workspace
  }
}


resource "aws_internet_gateway" "gateway" {
  vpc_id = aws_vpc.this.id
  tags = {
    env = terraform.workspace
  }
}


resource "aws_route_table" "route_table" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gateway.id
  }
  tags = {
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.public_subnet_a.id
  route_table_id = aws_route_table.route_table.id
}

data "aws_subnet_ids" "all" {
  vpc_id = aws_vpc.this.id
  depends_on = [
    aws_subnet.public_subnet_a,
  ]
}
