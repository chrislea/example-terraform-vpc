variable "availability_zones" {
  type        = list(string)
  description = "The AZs to target in this region"
  default = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c",
  ]
}

variable "create_ec2_connect_endpoint" {
  type        = bool
  description = "Whether or not to create an EC2 Connect Endpoint"
  default     = true
}

variable "main_cidr_block" {
  type        = string
  description = "The primary CIDR block for the VPC"
  default     = "10.213.0.0/16"
}

variable "igw_name" {
  type        = string
  description = "The name of the IGW"
  default     = "terraform-igw"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "The CIDR ranges for the public subnets"
  default = [
    "10.213.0.0/19",
    "10.213.32.0/19",
    "10.213.64.0/19",
  ]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "The CIDR ranges for the private subnets"
  default = [
    "10.213.96.0/19",
    "10.213.128.0/19",
    "10.213.160.0/19",
  ]
}

variable "public_subnet_name_prefix" {
  type        = string
  description = "The prefix for the public subnet names"
  default     = "public-subnet"
}

variable "private_subnet_name_prefix" {
  type        = string
  description = "The prefix for the private subnet names"
  default     = "private-subnet"
}

variable "region" {
  type        = string
  description = "The AWS Region to use"
  default     = "us-west-2"
}

variable "vpc_name" {
  type        = string
  description = "The name of the VPC"
  default     = "terraform-vpc"
}
