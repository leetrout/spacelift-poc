terraform {
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

variable "pmm_security_groups" {
  type = list(string)
}

variable "pmm_subnet" {
  type = string
}

# data "aws_ami" "cent7" {
#   most_recent = true

#   filter {
#     name   = "name"
#     values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

#   owners = ["099720109477"] # Canonical
# }

resource "aws_instance" "web" {
  ami           = "ami-002070d43b0a4f171"
  instance_type = "t3.micro"
  vpc_security_group_ids = var.pmm_security_groups
  subnet_id = var.pmm_subnet

  tags = {
    Name = "PMM Host"
  }
}
