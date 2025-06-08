variable "ec2_instance_type" {
  default = "t2.micro"
}

variable "ec2_key_name" {
  default = "Test-Key"
}

variable "aws_subnet_cidr"{
    type = list(string)
    default = ["10.0.1.0/24"]
}