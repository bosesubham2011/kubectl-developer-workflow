output "my_vpc_id" {
  value = module.vpc.vpc_id
}

output "priv_sub_id" {
    value = module.priv_sub.id
}

output "pub_sub_id" {
  value = module.pub_sub.id
}