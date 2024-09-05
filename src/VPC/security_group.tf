resource "aws_security_group" "allow_tls" {
  name        = var.vpc_sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id      = aws_vpc.vpc.id

  tags = {
    Name = var.vpc_sg_name
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_security_group_rule" "allow_tls_https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = [var.sg_cidr]
  security_group_id = aws_security_group.allow_tls.id
}

resource "aws_security_group_rule" "allow_tls_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = [var.sg_cidr]
  security_group_id = aws_security_group.allow_tls.id
}

resource "aws_security_group_rule" "allow_all_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"] # Allows traffic to anywhere
  security_group_id = aws_security_group.allow_tls.id
}
