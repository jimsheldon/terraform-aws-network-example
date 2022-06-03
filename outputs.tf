output "main_vpc_id" {
  value       = aws_vpc.main.id
  description = "The main VPC id"
}

output "nat_id" {
  value       = aws_eip.nat.id
  description = "Elastic IP ID"
}

output "nat_name_tag" {
  value = aws_eip.nat.tags["Name"]
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "The public subnet id"
}

output "private_subnet_id" {
  value       = aws_subnet.private.id
  description = "The private subnet id"
}

