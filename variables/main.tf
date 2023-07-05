resource "aws_vpc" "main" {
  cidr_block         = var.cidr_block
  instance_tenancy   = var.instance_tenancy
  enable_dns_support = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags                 = var.tags
}
# security group for postgress RDS, 5432
resource "aws_security_group" "allow_postgress" {
  name        = "allow_postgress"
  description = "allow_postgress inbound traffic"
  vpc_id      = aws_vpc.main.id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.postgress_port
    to_port          = var.postgress_port
    protocol         = "tcp"
    cidr_blocks      = var.cidr_list

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.tags
  }
#EC2 instance resource
resource "aws_instance" "web-server" {
  count = 3
  ami           = "ami-04823729c75214919"
  instance_type = "t2.micro"
  tags = {
    Name= var.instance_names[count.index]
  }

}
resource "aws_instance" "web-server" {
  ami           = "ami-04823729c75214919"
  instance_type = var.isprod ? "t3.large" : "t2.micro"
}






