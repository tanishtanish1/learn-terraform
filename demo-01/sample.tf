provider "aws" {
  region = "us-east-1"  # Update with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-03265a0778a880afb"  # Update with your desired AMI ID
  instance_type = "t2.micro"  # Update with your desired instance type

  tags = {
    Name = "Example EC2 Instance"
  }
}
