output "alb_id" {
  description = "The ID of the ALB"
  value       = aws_lb.alb.id
}

output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.alb.arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}
