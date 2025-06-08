output "vpc_id" {
    value = aws.main_vpc.id
}

output "priv_sub" {
    value = {for subnet, cidr in aws_aws_subnet.priv_sub : cidr => subnet.id}
}

output "pub_sub" {
    value = {for subnet, cidr in aws_aws_subnet.pub_sub : cidr => subnet.id}
}