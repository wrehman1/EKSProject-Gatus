variable "name" {
  description = "Name prefix for network resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block used by the VPC"
  type        = string
}

variable "availability_zones" {
  description = "Availability Zones."
  type        = list(string)
}

variable "public_subnets" {
  description = "Public subnet CIDRs."
  type        = list(string)  
}

variable "private_subnets" {
  description = "Private subnet CIDRs."
  type        = list(string)
}

variable "cluster_name" {
  description = "EKS Cluster name used for Kubernetes subnet discovery."
  type        = string
}

variable "single_nat_gateway" {
  description = "Whether to provision one shared NAT Gateway."
  type = bool
  default = true
}