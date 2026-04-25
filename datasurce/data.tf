data "aws_ami" "al2023" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-*-x86_64"]
  }

  filter {
        name   = "root-device-type"
        values = ["ebs"]
    }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_vpc" "vpcdetails" {
  default = true
}

output "aws_vpc" {
  value = data.aws_vpc.vpcdetails.id
}

output  "ami_id" {
  value       = data.aws_ami.al2023.id
}
