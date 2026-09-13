module "vpc" {
  source                = "terraform-aws-modules/vpc/aws"
  version               = "6.7.2"
}

name                    = var.name
cidr                    = var.vpc_cidr

availability_zones      = var.availability_zones

public_subnets          = var.public_subnets

private_subnets         = var.private_subnets

enable_nat_gateway      = true
single_nat_gateway      = var.single_nat_gateway

map_public_ip_on_launch = true

public_subnets_tags     = {
   "kubernetes.io/role/elb" = "1"
}

private_subnets_tags    = {
    "kubernetes.io/role/internal-elb" = "1"
}

tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"

}