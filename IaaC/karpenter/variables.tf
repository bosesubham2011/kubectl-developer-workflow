variable "ec2_name" {
  default = "my-eks-cluster"
}

variable "provisioner_name" {
  type    = string
  default = "my-provisioner"
}

variable "nodeclass_name" {
  type    = string
  default = "my-nodeclass"
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t3.micro"]
}