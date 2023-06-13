terraform {
  required_version = "1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.57.0"
      }
  }
}

provider "aws" {
  region = "us-east-1"
}

variable "audit_trail_secret" {
  type = string
}

module "collector" {
  source = "github.com/spacelift-io-examples/terraform-aws-spacelift-events-collector"
  secret = var.audit_trail_secret
}
