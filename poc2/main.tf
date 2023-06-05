terraform {
  required_version = "1.4.6"
}

variable "input" {
  type = string
}

output "external-input" {
    value = var.input
}
