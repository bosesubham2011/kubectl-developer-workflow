output "vpc_id" {
    value = aws_vpc.main_vpc.id
}

output "priv_sub" {
    value = {for cidr, subnet in aws_subnet.priv_sub : cidr => subnet.id}
}

output "pub_sub" {
    value = {for cidr, subnet in aws_subnet.pub_sub : cidr => subnet.id}
}