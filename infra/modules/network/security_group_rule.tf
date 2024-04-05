# SecurityGroupRules for opmng
resource "aws_security_group_rule" "opmng_in_tcp22" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.opmng_sg.id
}

resource "aws_security_group_rule" "opmng_out_http" {
  security_group_id = aws_security_group.opmng_sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "opmng_out_https" {
  security_group_id = aws_security_group.opmng_sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "opmng_out_db" {
  security_group_id = aws_security_group.opmng_sg.id
  type              = "egress"
  protocol          = "tcp"
  from_port         = 3306
  to_port           = 3306
  cidr_blocks       = ["0.0.0.0/0"]
}

# SecurityGroupRules for db
resource "aws_security_group_rule" "dbsource_in_tcp3306" {
  type                     = "ingress"
  from_port                = var.db_ports[0].internal
  to_port                  = var.db_ports[0].external
  protocol                 = var.db_ports[0].protocol
  security_group_id        = aws_security_group.rds_sg.id
  source_security_group_id = aws_security_group.opmng_sg.id
}

# resource "aws_security_group_rule" "dbsource_out_tcp3306" {
#   type              = "egress"
#   from_port         = var.db_ports[0].internal
#   to_port           = var.db_ports[0].external
#   protocol          = var.db_ports[0].protocol
#   cidr_blocks       = ["0.0.0.0/0"]
#   security_group_id = aws_security_group.rds_sg.id
# }
