output "instance_public_ip" {
  value = module.ec2_app[*].instance_public_ips
}

output "instance_private_ips" {
  description = "Private IP addresses of the EC2 instances"
  value       = module.ec2_app[*].instance_private_ips
}
