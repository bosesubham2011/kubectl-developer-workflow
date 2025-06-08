output "my_vpc_id" {
  value = module.vpc.vpc_id
}

output "priv_sub_id" {
    value = module.vpc.priv_sub.subnet.id
}

output "pub_sub_id" {
  value = module.vpc.pub_sub.subnet.id
}