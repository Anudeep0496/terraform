data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "expense" {
    ami         = data.aws_ami.al2023.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"
    key_name = var.key_name
    tags = var.ec2_tags
}

resource "aws_security_group" "allow_tls" {
    name = "var.sg_tags"
    description = "Creating a allow_tls sg"
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr_blocks
    }

    ingress {
        from_port = var.from_port
        to_port = var.to_port
        protocol = "tcp"
        cidr_blocks = var.cidr_blocks
    }

    tags = var.sg_tags
}