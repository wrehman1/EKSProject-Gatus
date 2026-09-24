module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.25.0"

  name               = var.cluster_name
  kubernetes_version = var.kubernetes_version

  vpc_id     = var.vpc_id
  subnet_ids = var.private_subnet_ids

  endpoint_private_access = true
  endpoint_public_access  = true

  enable_cluster_creator_admin_permissions = true

  addons = {
    coredns = {
      most_recent = true
    }

    kube-proxy = {
      most_recent = true
    }

    vpc-cni = {
      most_recent    = true
      before_compute = true
    }

    eks-pod-identity-agent = {
      most_recent    = true
      before_compute = true
    }
  }

  security_group_additional_rules = {
    node_to_node = {
      description = "Allow communication between worker nodes"
      protocol    = "-1"
      from_port   = 0
      to_port     = 65535
      self        = true
      type        = "ingress"
    }
  }
  eks_managed_node_groups = {
    general = {
      name = "${var.cluster_name}-workers"

      instance_types = var.node_instance_types

      ami_type = "AL2023_x86_64_STANDARD"

      min_size     = var.node_min_size
      desired_size = var.node_desired_size
      max_size     = var.node_max_size

      subnet_ids = var.private_subnet_ids

      capacity_type = "ON_DEMAND"

      create_iam_role = false
      iam_role_arn    = var.worker_role_arn

      labels = {
        workload = "general"
      }

      metadata_options = {
        http_endpoint               = "enabled"
        http_tokens                 = "required"
        http_put_response_hop_limit = 2
      }
    }
  }
}