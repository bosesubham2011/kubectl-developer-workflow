variable "ec2_instance_type" {
  default = "t3.nano"
}

variable "ec2_key_name" {
  default = "Test-Key"
}

variable "aws_subnet_cidr"{
    type = list(string)
    default = ["10.0.1.0/24"]
}