output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.vpc.id
}

output "internet_gateway_id" {
  description = "The ID of the IGW"
  value       = aws_internet_gateway.internet-gateway.id
}

output "nat_gw_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.nat-gateway.id
}

output "eip_id" {
  description = "The ID of the EIP"
  value       = aws_eip.eip-nat.id
}
