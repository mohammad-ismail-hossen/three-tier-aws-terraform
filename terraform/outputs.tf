output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "rds_endpoint" {
  description = "Endpoint of the rds db instance."
  value       = aws_db_instance.project-db.endpoint
}