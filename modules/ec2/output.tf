output "instance_public_ips" {
  value = aws_instance.example[*].public_ip
}
