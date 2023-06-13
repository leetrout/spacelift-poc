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
  source = "github.com/leetrout/terraform-aws-spacelift-events-collector"
  secret = var.audit_trail_secret
  events_expiration_days = 7
  logs_retention_days = 7
  delete_events_when_destroying_stack = true
  buffer_interval = 60
}
