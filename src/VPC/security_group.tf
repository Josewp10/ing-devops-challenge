resource "aws_security_group" "ecs_sg" {
  name        = var.vpc_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.vpc_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "ecs_sg_https" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = var.sg_cidr
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "ecs_sg_http" {
  security_group_id = aws_security_group.ecs_sg.id
  cidr_ipv4         = var.sg_cidr
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_security_group" "load_balancer_sg" {
  name        = "load-balancer-security-group"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = "load-balancer-security-group"
  }
}