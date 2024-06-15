# #Ec2 public ip
# output "app1PublicIP" {
#   description = "public IP"
#   value = aws_instance.app1.public_ip
# }

# #EC2 public DNS
# output "app1PublicDns" {
#   description = "public DNS"
#   value = aws_instance.app1.public_dns

#list
output "instance_list" {
  description = "instance list"
  value       = [for ins in aws_instance.app1 : ins.public_dns]
}

#Map
output "instance_map" {
  description = "instance map"
  value = {
    for ins in aws_instance.app1 : ins.id => ins.public_dns
  }
}

#map2
output "instance_map_count" {
  description = "instance map 2"
  value = {
    for c, ins in aws_instance.app1 : c => ins.public_dns
  }
}

#splat
output "instance_splat" {
  description = "splat"
  value       = aws_instance.app1.*.public_dns
}

#splat 2
output "instance_splat_co" {
  description = "spalat"
  value       = aws_instance.app1[*].public_dns
}
