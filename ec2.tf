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

resource "aws_instance" "this" {
    ami         = data.aws_ami.al2023.id
    vpc_security_group_ids = [aws_security_group.allow_tls.id]
    instance_type = "t3.micro"
    key_name = "learningdevops"
    tags = {
        Name = "terraform-demo"
    }
}

resource "aws_security_group" "allow_tls" {
    name = "allow_tls"
    description = "Creating a allow_tls sg"
 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_tls"
    }
}