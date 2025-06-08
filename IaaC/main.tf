module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./ec2"
    aws_subnet_cidr = module.vpc.priv_sub
}

module "karpenter" {
  source = "./modules/karpenter"

  cluster_name      = "my-eks-cluster"
  nodeclass_name    = "default"
  provisioner_name  = "default"
  instance_types    = ["t3.large", "m5.large"]
}