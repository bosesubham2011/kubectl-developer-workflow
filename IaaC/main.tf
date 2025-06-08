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
  subnet_ids          = ["subnet-123", "subnet-456"]
  instance_types      = ["t3.medium"]
  desired_size        = 2
  max_size            = 3
  min_size            = 1
  ssh_key_name        = "my-ssh-key"
  capacity_type       = "ON_DEMAND"
}
