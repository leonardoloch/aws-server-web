output "this_vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.this.id
}

output "this_subnet_ids" {
  description = "All the subnet ids"
  value       = data.aws_subnet_ids.all.ids
}
