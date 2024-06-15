#splat
output "instance_splat" {
  description = "splat"
  value       = [for ins in aws_instance.app1 : ins.public_ip]
}

#splat 2
output "instance_splat_co" {
  description = "spalat"
  value       = [for ins in aws_instance.app1 : ins.public_dns]
}

output "instance_pub" {
  description = "isntrnce pub"
  value       = tomap({ for az, ins in aws_instance.app1 : az => ins.public_dns })
}
