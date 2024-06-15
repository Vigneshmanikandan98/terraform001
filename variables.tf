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

#keypair
variable "instance_keypair" {
  description = "Instance Key pair"
  type = string
  default = "terraform-key"
}

#instance list
variable "instance_type_list" {
  description = "EC2 list"
  type = list(string)
  default = [ "t3.micro", "t3.small" ]
}

#instance map
variable "instance_type_map" {
  description = "EC2 map"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.small"
    "prod" = "t3.large"
  }
}