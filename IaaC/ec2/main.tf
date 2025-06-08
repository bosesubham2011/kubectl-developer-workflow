data "aws_ami" "ec2_ami" {
    most_recent = true
    owners = ["099720109477"]
    filter {
      name = "name"
      values = ["ubuntu/images/*"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
    filter {
        name = "architecture"
      values = ["x86_64"]
    }
}

resource "aws_instance" "my_ec2" {
    count = length(var.aws_subnet_cidr)
    ami = data.aws_ami.ec2_ami.id
    instance_type = var.ec2_instance_type
    subnet_id = values(var.aws_subnet_cidr)[0]

    key_name = var.ec2_key_name
    tags = {
        Name = "Ec2-instance=${count.index + 1}"
    }
}