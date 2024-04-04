# SecurityGroup for RDS
resource "aws_security_group" "rds_sg" {
  name   = "rds-sg"
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.app_name}-rds-sg"
  }
}
