output "role_arn" {
  description = "Worker node IAM role ARN."
  value       = aws_iam_role.worker.arn
}

output "role_name" {
  description = "Worker node IAM role name."
  value       = aws_iam_role.worker.name
}