locals {
  ami_id = data.aws_ami.al2023.id
  instance_type = "t3.micro"
}