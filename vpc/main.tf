resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "timing-1"
    Terraform= "true"
    Environment= "Dev"
  }


}



resource "aws_vpc" "main" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    Name = "timing-1"
    Terraform= "true"
    Environment= "Dev"
  }
}

resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "timing-1-public subnet"
    Terraform= "true"
    Environment= "Dev"
  }


}

