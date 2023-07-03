output "random_name" {
  value = random_string.rgname.*.result
}