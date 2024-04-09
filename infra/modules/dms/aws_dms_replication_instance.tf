# Create a new replication instance
resource "aws_dms_replication_instance" "main" {
  replication_instance_id    = "main-dms-replication"
  engine_version             = "3.5.1"
  replication_instance_class = "dms.t3.micro"
  allocated_storage          = 50
  publicly_accessible        = true
  multi_az                   = false
  availability_zone          = "ap-northeast-1a"

  apply_immediately            = true
  auto_minor_version_upgrade   = false
  preferred_maintenance_window = "sun:10:30-sun:14:30"
  replication_subnet_group_id  = aws_dms_replication_subnet_group.main.id

  tags = {
    Name = "${var.app_name}-main"
  }
}
