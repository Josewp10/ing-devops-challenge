output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_id" {
  value = [aws_subnet.public_subnet_a.id, aws_subnet.public_subnet_b.id]
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "load_balancer_sg_id" {
  value = aws_security_group.load_balancer_sg.id
}

output "ecs_sg_id" {
  value = aws_security_group.ecs_sg.id
}