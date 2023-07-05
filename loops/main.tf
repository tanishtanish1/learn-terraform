resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "var.project_name"
    Terraform= "true"
    Environment= "Dev"
  }
}
resource "aws_subnet" "public_subnet" {
  count = length(var.public_subnet_cidr) #count=2
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
}
tags ={
  Name=var.public_subnet_name[count.index]
}