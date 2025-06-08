resource "aws_eks_node_group" "this" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn
  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  instance_types = var.instance_types

  ami_type       = var.ami_type

  remote_access {
    ec2_ssh_key               = var.ssh_key_name
  }


  capacity_type = var.capacity_type

  lifecycle {
    create_before_destroy = true
  }
}
