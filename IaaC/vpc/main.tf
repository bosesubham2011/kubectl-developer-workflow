resource "aws_vpc" "main_vpc" {
    cidr_block = var.vpc_cidr_block
}

data "aws_availability_zones" "available" {
    state = "available"
}

resource "aws_subnet" "priv_sub" {
    for_each = toset(var.priv_sub_cidr)
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = each.value
    count = length(var.priv_sub_cidr)
    availability_zone = data.aws_availability_zones.available.names[index(var.priv_sub_cidr, each.value)]
}

resource "aws_subnet" "pub_sub" {
    for_each = toset(var.pub_sub_cidr)
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = each.value
    count = length(var.pub_sub_cidr)
    availability_zone = data.aws_availability_zones.available.names[index(var.pub_sub_cidr, each.value)]
}