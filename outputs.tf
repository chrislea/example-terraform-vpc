output "vpc_id" {
  value = aws_vpc.main.id
}

output "vpc_cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "vpc_public_subnets" {
  value = [
    for s in aws_subnet.public_subnets : {
      id         = s.id,
      cidr_block = s.cidr_block
  }]
}

output "vpc_private_subnets" {
  value = [
    for s in aws_subnet.private_subnets : {
      id         = s.id,
      cidr_block = s.cidr_block
  }]
}

output "vpc_gateway" {
  value = aws_internet_gateway.gw
}
