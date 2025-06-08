module "vpc" {
    source = "./vpc"
}

module "ec2" {
    source = "./ec2"
    aws_subnet_cidr = module.vpc.priv_sub
}