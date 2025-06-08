output "my_vpc_id" {
  value = module.vpc.vpc_id
}

output "priv_sub_id" {
    value = module.vpc.priv_sub
}

output "pub_sub_id" {
  value = module.vpc.pub_sub
}

output "ec2_id" {
    value = module.ec2.ec2_id
}