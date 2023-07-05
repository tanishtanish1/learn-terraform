variable "public_subnet_cidr" {
  type = list
  default = ["10.0.1.0/24","10.0.2.0/24"]
}
variable "azs" {
  type = list
  default = ["us-east-1a","us-east-1b"]
}
variable "public_subnet_name" {
  type = list
  default = ["public-1a","public-1b"]
}