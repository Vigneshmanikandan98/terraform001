# module "my-vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   #basic details
#   name = "my-vpc"
#   cidr = "10.0.0.0/16"

#   # azs and subnets
#   azs             = ["us-east-1a", "us-east-1b"]
#   private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
#   public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

#   #database subnets
#   create_database_subnet_group       = true
#   create_database_subnet_route_table = true
#   database_subnets                   = ["10.0.151.0/24", "10.0.152.0/24"]

#   #nat gateway
#   enable_nat_gateway = true
#   single_nat_gateway = true

#   #dns
#   enable_dns_hostnames = true
#   enable_dns_support   = true

#   public_subnet_tags = {
#     Name = "Public-Subnets-Vpc"
#   }

#   private_subnet_tags = {
#     Name = "Private-Subnets-Vpc"
#   }

#   database_subnet_tags = {
#     Name = "Db-Subnets"
#   }

#   tags = {
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }

data "aws_vpc" "default" {
  default = true
}

module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.2"

  name = "My-SG"

  vpc_id = data.aws_vpc.default.id

  ingress_rules       = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/16"]
  egress_rules        = ["all-all"]
  egress_cidr_blocks  = ["0.0.0.0/24"]
}

resource "aws_instance" "newEc2" {
  ami           = "ami-08a0d1e16fc3f61ea"
  instance_type = "t3.micro"

  #security_groups = [module.security-group.security_group_id]

  vpc_security_group_ids = [module.security-group.security_group_id]

  tags = {
    "name" = "Hello"
  }
}
