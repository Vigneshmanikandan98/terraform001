resource "aws_vpc" "staticVpcTerraform" {
  cidr_block = "10.0.0.0/16"
  
}

resource "aws_security_group" "allow_tls" {
  ingress  {
    from_port = 433
    to_port = 433
    protocol = "tcp"
    cidr_blocks = ["1.2.3.4/32"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
  }
}


resource "aws_instance" "ec2Init" {
  ami           = "ami-08a0d1e16fc3f61ea" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}
