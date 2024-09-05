resource "aws_security_group" "allow_tls" {
  name        = var.vpc_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.vpc_sg_name
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = var.sg_cidr
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}