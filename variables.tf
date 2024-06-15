# AWS Region
variable "aws_region" {
  description = "AWS Region"
  type = string
  default = "us-east-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance type"  
  type = string
  default = "t2.micro"
}

variable "instance_keypair" {
  description = "Instance Key pair"
  type = string
  default = "terraform-key"
}