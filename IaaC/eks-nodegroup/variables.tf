variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "node_group_name" {
  type        = string
  description = "Name for the EKS node group"
}

variable "node_role_arn" {
  type        = string
  description = "IAM role ARN for the EKS node group"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for the node group"
}

variable "instance_types" {
  type        = list(string)
  description = "EC2 instance types for the worker nodes"
}

variable "desired_size" {
  type        = 1
  description = "Desired number of worker nodes"
}

variable "max_size" {
  type        = 2
  description = "Maximum number of worker nodes"
}

variable "min_size" {
  type        = 1
  description = "Minimum number of worker nodes"
}

variable "ami_type" {
  type        = string
  default     = "AL2_x86_64"
  description = "Type of Amazon Machine Image (AMI)"
}

variable "capacity_type" {
  type        = string
  default     = "ON_DEMAND"
  description = "Capacity type: ON_DEMAND or SPOT"
}

variable "ssh_key_name" {
  type        = string
  description = "SSH key name for EC2 instances"
}