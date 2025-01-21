output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.private_vpc.id
}

output "availability_zones" {
  description = "The availability zones of the subnets"
  value       = var.availability_zones
}

output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [for subnet in aws_subnet.public_subnets : subnet.id]
}

output "private_subnet_ids" {
  description = "The IDs of the private subnets"
  value       = [for subnet in aws_subnet.private_subnets : subnet.id]
}

output "public_subnet_cidrs" {
  description = "The CIDR blocks of the public subnets"
  value       = [for subnet in aws_subnet.public_subnets : subnet.cidr_block]
}

output "private_subnet_cidrs" {
  description = "The CIDR blocks of the private subnets"
  value       = [for subnet in aws_subnet.private_subnets : subnet.cidr_block]
}