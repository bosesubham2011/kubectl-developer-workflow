variable "vpc_name" {
  default = "my-vpc"
}

variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
}

variable "priv_sub_cidr" {
    type = list(string)
    default = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}

variable "pub_sub_cidr" {
    type = list(string)
    default = ["10.0.2.0/24", "10.0.4.0/24", "10.0.6.0/24"]
}