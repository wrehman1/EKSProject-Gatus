output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnets_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.network.private_subnets_ids
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "worker_iam_arn" {
  value = module.worker_iam.role_arn
}

output "cluster_security_group_id" {
  value = module.eks.cluster_security_group_id
}

output "node_security_group_id" {
  value = module.eks.node_security_group_id
}