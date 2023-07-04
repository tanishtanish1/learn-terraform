resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name        = "timing-1"
    Terraform   = "true"
    Environment = "Dev"
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

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = "timing-1-public-routetable"
    Terraform= "true"
    Environment= "Dev"
  }

}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public-subnet.id
  route_table_id = aws_route_table.public_route_table.id
}
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.11.0/24"
  tags = {
    Name = "timing-1-private- subnet"
    Terraform= "true"
    Environment= "Dev"
  }


}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id



  tags = {
    Name = "timing-1-private-routetable"
    Terraform= "true"
    Environment= "Dev"
  }

}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.private-subnet.id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_subnet" "database-subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.21.0/24"
  tags = {
    Name = "timing-1-database- subnet"
    Terraform= "true"
    Environment= "Dev"
  }


}

resource "aws_route_table" "database_route_table" {
  vpc_id = aws_vpc.main.id



  tags = {
    Name = "timing-1-database-routetable"
    Terraform= "true"
    Environment= "Dev"
  }

}

resource "aws_route_table_association" "database" {
  subnet_id      = aws_subnet.database-subnet.id
  route_table_id = aws_route_table.private_route_table.id
}
#create elastic ip
resource "aws_eip" "nat" {}


resource "aws_nat_gateway" "gw" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-subnet.id


}

resource "aws_route" "private" {
  route_table_id            = "aws_route_table.private_route_table.id"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = "aws_nat_gateway.gw.id"
  #depends_on                = ["aws_route_table.private"]
}
resource "aws_route" "database" {
  route_table_id            = "aws_route_table.database_route_table.id"
  destination_cidr_block    = "0.0.0.0/0"
  nat_gateway_id = "aws_nat_gateway.gw.id"
  #depends_on                = ["aws_route_table.database_route_table"]
}





