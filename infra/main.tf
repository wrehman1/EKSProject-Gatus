locals {
  name         = "${var.project_name}-${var.environment}"
  cluster_name = "${var.project_name}-eks"
}

module "vpc" {
  source = "./modules/vpc"

  name = "${local.name}-vpc"

  cluster_name = local.cluster_name

  vpc_cidr = var.vpc_cidr

  availability_zones = var.availability_zones

  public_subnets = var.public_subnets

  private_subnets = var.private_subnets

  single_nat_gateway = true
}

module "worker_iam" {
  source = "./modules/worker-iam"

  name = "${local.name}-eks-worker-role"
}

module "eks" {
  source = "./modules/eks"

  cluster_name = local.cluster_name

  kubernetes_version = var.kubernetes_version

  vpc_id = module.vpc.vpc_id

  private_subnet_ids = module.vpc.private_subnet_ids

  worker_role_arn = module.worker_iam.role_arn

  node_instance_types = var.node_instance_types

  node_min_size = var.node_min_size

  node_desired_size = var.node_desired_size

  node_max_size = var.node_max_size
}