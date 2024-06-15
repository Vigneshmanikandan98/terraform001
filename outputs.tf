#Ec2 public ip
output "app1PublicIP" {
  description = "public IP"
  value = aws_instance.app1.public_ip
}

#EC2 public DNS
output "app1PublicDns" {
  description = "public DNS"
  value = aws_instance.app1.public_dns
}