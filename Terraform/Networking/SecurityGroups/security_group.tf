resource "aws_security_group" "sg" {
  for_each = var.security_group_map
  name        = each.value.name
  description = each.value.description
  vpc_id      = each.value.vpc_id # cuidado,se debe recibir el nombre y mapear el id

  tags = {
    Name = each.value.name
  }
}
/*
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
*/