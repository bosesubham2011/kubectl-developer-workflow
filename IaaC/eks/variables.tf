variable "security_group_ids" {
  description = "List of security group IDs to associate with the EKS cluster"
  type        = list(string)
  default     = ["xyz"]
}

variable "subnet_ids" {
  description = "List of subnet IDs to associate with the EKS cluster"
  type        = list(string)
  default     = []
}