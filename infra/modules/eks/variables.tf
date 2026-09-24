variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "kubernetes_version" {
  description = "Kubernetes version."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs used by EKS."
  type        = list(string)
}

variable "worker_role_arn" {
  description = "Existing IAM role ARN used by worker nodes."
  type        = string
}

variable "node_instance_types" {
  description = "EC2 instance types used by worker nodes."
  type        = list(string)
}

variable "node_min_size" {
  type = number
}

variable "node_desired_size" {
  type = number
}

variable "node_max_size" {
  type = number
}