resource "aws_instance" "ec2Init" {
  ami           = "ami-08a0d1e16fc3f61ea" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}
