output "vpc_id" {
  description = "The ID of the VPC"
  value       = local.vpc_id
}

output "internet_gateway_id" {
  description = "The ID of the IGW"
  value       = module.vpc.igw_id
}

output "nat_gw_id" {
  description = "The ID of the NAT Gateway"
  value       = module.vpc.natgw_ids[0]
}

output "eip_id" {
  description = "The ID of the EIP"
  value       = module.vpc.nat_ids[0]
}
