resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks-cluster-sg"
  description = "Security group for EKS cluster"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules_eks
    content {
      from_port   = each.value.from_port
      to_port     = each.value.to_port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules_eks
    content {
      from_port   = each.value.from_port
      to_port     = each.value.to_port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
    }
  }

}

resource "aws_security_group" "ec2_instance_sg" {
  name        = "ec2-instance-sg"
  description = "Security group for EC2 instances"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules_ec2
    content {
      from_port   = each.value.from_port
      to_port     = each.value.to_port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
    }
  }

  dynamic "egress" {
    for_each = var.egress_rules_ec2
    content {
      from_port   = each.value.from_port
      to_port     = each.value.to_port
      protocol    = each.value.protocol
      cidr_blocks = each.value.cidr_blocks
    }
  }
}
