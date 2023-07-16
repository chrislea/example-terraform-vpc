variable "availability_zones" {
  type        = list(string)
  description = "The AZs to target in this region"
  default = [
    "us-west-2a",
    "us-west-2b",
    "us-west-2c"
  ]
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "The CIDR ranges for the public subnets"
  default = [
    "10.253.0.0/19",
    "10.253.32.0/19",
    "10.253.64.0/19"
  ]
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "The CIDR ranges for the private subnets"
  default = [
    "10.253.96.0/19",
    "10.253.128.0/19",
    "10.253.160.0/19"
  ]
}

variable "region" {
  type        = string
  description = "The AWS Region to use"
  default     = "us-west-2"
}
