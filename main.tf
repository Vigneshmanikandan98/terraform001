resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_instance" "ec2Init" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = "t3.micro"
  user_data = file("${path.module}/app1-install.sh")

  tags = {
    Name = "app1"
  }
}
