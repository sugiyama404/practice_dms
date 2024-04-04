# SecurityGroupRules for db
resource "aws_security_group_rule" "rds_in_api" {
  type              = "ingress"
  from_port         = var.db_ports[0].internal
  to_port           = var.db_ports[0].external
  protocol          = var.db_ports[0].protocol
  security_group_id = aws_security_group.rds_sg.id
}