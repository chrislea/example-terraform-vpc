# Example VPC in Terraform

A straighforward AWS VPC managed by
[Terraform](https://www.terraform.io).

This was largely inspired / influenced / taken from [this
tutorial](https://spacelift.io/blog/terraform-aws-vpc) from the fine
folks at [Spacelift](https://spacelift.io/).

It creates a VPC in the `us-west-2` region, with public and private
subnets in three AZs. It also creates a "completely open" security
group for the VPC that can be attached to EC2 instances to make sure
they have connectivity.
