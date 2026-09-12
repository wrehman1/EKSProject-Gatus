variable "aws_region" {
    description = "AWS region"
    type        = string
    default     = "eu-west-2" 
}

variable "project_name" {
    description = "Project name used for resource naming"
    type        = string
    default     = "gatus"
}

variable "environment" {
    description = "Deployment environment"
    type        = string
    default     = "dev"
}

variable "vpc_cidr" {
    description = "CIDR block for the VPC"
    type        = string
    default     = "10.20.0.0/16"
}

variable "availability_zones" {
    description = "Availability Zones used by the VPC"
    type        = list(string)

    default     = [ 
        "eu-west-2a",
        "eu-west-2b"
     ]
}

variable "public_subnets" {
    description = "CIDR ranges for public subnets."
    type        = list(string)

    default     = [ 
        "10.20.0.0/24",
        "10.20.1.0/24"
    ]
}

variable "private_subnets" {
    description = "CIDR ranges for private subnets"
    type        = list(string)

    default     = [ 
        "10.20.10.0/24",
        "10.20.11.0/24" 
    ]
}

variable "kubernetes_version" {
    description = "Kubernetes version used by EKS"
    type        = string
    default     = "1.36"
}

variable "node_instance_types" {
    description = "EC2 instance types used by EKS worker nodes."
    type        = list(string)

    default     = [ 
      "t3.medium" 
    ]
}

variable "node_min_size" {
    description = "Minimum EKS node count."
    type        = number
    default     = 2
}

variable "node_desired_size" {
    description = "Desired EKS node count."
    type        = number
    default     = 2
}

variable "node_max_size" {
    description = "Maximum EKS node count."
    type        = number
    default     = 4
}