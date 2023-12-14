output "route_table_id" {
  value = aws_route_table.main.id
}

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

output "ec2_instance_connect_endpoint_arn" {
  value = var.create_ec2_connect_endpoint ? aws_ec2_instance_connect_endpoint.ec2connect[0].arn : null
}

output "ec2_instance_connect_endpoint_dns_name" {
  value = var.create_ec2_connect_endpoint ? aws_ec2_instance_connect_endpoint.ec2connect[0].dns_name : null
}

output "vpc_gateway" {
  value = aws_internet_gateway.gw
}
