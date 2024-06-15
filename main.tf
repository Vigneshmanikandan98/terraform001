data "aws_ami" "awslinux" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-*-gp2"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

# Security group - ssh
resource "aws_security_group" "vpc_ssh" {
  description =  "ssh-vpc"
  name = "vpc_ssh"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "-1" ]
  }

  tags = {
    name = "allow-ssh"
  }
}

#Security group web
resource "aws_security_group" "vpc_web" {
  description =  "web-vpc"
  name = "vpc_web"

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "-1" ]
  }

  tags = {
    name = "allow-ssh"
  }
}