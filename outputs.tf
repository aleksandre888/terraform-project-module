output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = module.alb.alb_dns_name
}

output "ec2_private_ips" {
  description = "The private IP addresses of the EC2 instances"
  value       = module.ec2.ec2_private_ips
}

output "public_subnet_cidrs" {
  description = "The CIDR blocks of the public subnets"
  value       = module.vpc.public_subnet_cidrs
}

output "private_subnet_cidrs" {
  description = "The CIDR blocks of the private subnets"
  value       = module.vpc.private_subnet_cidrs
}

output "availability_zones" {
  description = "The availability zones of the VPC"
  value       = module.vpc.availability_zones
}