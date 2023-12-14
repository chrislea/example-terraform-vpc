resource "aws_vpc" "main" {
  cidr_block           = var.main_cidr_block
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "public_subnets" {
  count = length(var.public_subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.public_subnet_name_prefix}-${count.index + 1}"
  }
}

resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnet_cidrs)

  vpc_id            = aws_vpc.main.id
  cidr_block        = element(var.private_subnet_cidrs, count.index)
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name = "${var.private_subnet_name_prefix}-${count.index + 1}"
  }
}

resource "aws_ec2_instance_connect_endpoint" "ec2connect" {
  count              = var.create_ec2_connect_endpoint ? 1 : 0
  subnet_id          = aws_subnet.public_subnets[0].id
  preserve_client_ip = true
  security_group_ids = [aws_security_group.allow_all.id]

  tags = {
    Name = "eice-${aws_subnet.public_subnets[0].id}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = var.igw_name
  }
}
