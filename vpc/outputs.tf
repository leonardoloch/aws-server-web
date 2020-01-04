output "this_vpc_id" {
  description = "The VPC ID"
  value       = aws_vpc.this.id
}

output "this_subnet_a_id" {
  description = "Id subnet a"
  value       = aws_subnet.public_subnet_a.id
}

output "this_subnet_b_id" {
  description = "Id subnet b"
  value       = aws_subnet.private_subnet_b.id
}