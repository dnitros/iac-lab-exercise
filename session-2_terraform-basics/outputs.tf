output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "public_subnet_1_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.public-subnet-1.id
}

output "public_subnet_2_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.public-subnet-2.id
}

output "private_subnet_1_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.private-subnet-1.id
}

output "private_subnet_2_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.private-subnet-2.id
}

output "secure_subnet_1_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.secure-subnet-1.id
}

output "secure_subnet_2_id" {
  description = "The ID of the VPC"
  value       = aws_subnet.secure-subnet-2.id
}
