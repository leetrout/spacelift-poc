terraform {
  required_version = "1.4.6"
}

output "foo" {
    value = "bar"
}

output "secret-baz" {
    value = "baz"
    sensitive = true
}
