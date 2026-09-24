output "vpc_id" {
  description = "VPC ID."
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "Public subnet IDS."
  value       = module.vpc.public_subnets
}

output "private_subnet_ids" {
  description = "Private subnet IDS."
  value       = module.vpc.private_subnets
}

output "nat_gateway_ids" {
  description = "NAT Gateway IDS"
  value       = module.vpc.natgw_ids
}