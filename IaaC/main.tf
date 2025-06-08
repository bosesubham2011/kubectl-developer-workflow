module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./ec2"
    aws_subnet_cidr = module.vpc.priv_sub
}

module "eks_nodegroup" {
  source              = "./eks-nodegroup"
  cluster_name        = "my-cluster"
  node_group_name     = "my-ng"
  subnet_ids          = module.vpc.priv_sub
  instance_types      = ["t3.medium"]
  desired_size        = 2
  max_size            = 3
  min_size            = 1
  ssh_key_name        = "my-ssh-key"
  capacity_type       = "ON_DEMAND"
}

module "security_groups" {
  source = "./sg"
  vpc_id = module.vpc.vpc_id

  ingress_rules_eks = [
    {
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "eks_cluster" {
  source              = "./eks-cluster"
  cluster_name        = "my-cluster"
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.priv_sub
  security_group_ids  = [aws_security_group.eks_cluster_sg.id]
  tags = {
    Name = "eks-cluster"
    Environment = "production"
  }
}