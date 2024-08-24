output "iam_role_arn" {
  description = "The ARN of the IAM role for Terraform Cloud"
  value       = aws_iam_role.terraform_cloud_role.arn
}