terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.57.0"
    }
  }
}

variable "worker_pool_config" {
  type = string
}

variable "worker_pool_private_key" {
  type = string
}

variable "worker_pool_id" {
  type = string
}

variable "worker_pool_security_groups" {
  type = list(string)
}

variable "worker_pool_subnets" {
  type = list(string)
}

# Copied from https://github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2
module "opsx_workerpool" {
  source = "github.com/spacelift-io/terraform-aws-spacelift-workerpool-on-ec2?ref=v1.6.0"

  configuration = <<-EOT
    export SPACELIFT_TOKEN="${var.worker_pool_config}"
    export SPACELIFT_POOL_PRIVATE_KEY="${var.worker_pool_private_key}"
  EOT

  min_size          = 0
  max_size          = 1
  worker_pool_id    = var.worker_pool_id
  security_groups   = var.worker_pool_security_groups
  vpc_subnets       = var.worker_pool_subnets
}
