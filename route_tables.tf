resource "aws_route_table" "main" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "Terraform Example Public Routing Table"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
  route_table_id = aws_route_table.main.id
}

resource "aws_route_table" "nat_gw" {
  count  = var.create_nat_gateway == true ? 1 : 0
  vpc_id = aws_vpc.main.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw[0].id
  }

  tags = {
    Name = "Terraform Example NAT Gateway Routing Table"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  count          = var.create_nat_gateway == true ? length(var.private_subnet_cidrs) : 0
  subnet_id      = element(aws_subnet.private_subnets[*].id, count.index)
  route_table_id = aws_route_table.nat_gw[0].id
}
