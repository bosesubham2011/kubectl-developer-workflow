data "aws_ami" "ec2_ami" {
    most_recent = true
    owners = ["137112412989"]
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
    ami = data.aws_ami.ec2_ami.id
    instance_type = var.ec2_instance_type
    subnet_id = var.aws_subnet.priv_sub[0]
    key_name = var.ec2_key_name
}