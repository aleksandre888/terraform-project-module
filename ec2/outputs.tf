output "ec2_private_ips" {
  description = "The private IP addresses of the EC2 instances"
  value       = [for instance in aws_instance.web-instance : instance.private_ip]
}

output "ec2_instances" {
  description = "The EC2 instances"
  value       = aws_instance.web-instance
}
