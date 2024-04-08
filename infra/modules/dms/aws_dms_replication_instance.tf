# Create a new replication instance
resource "aws_dms_replication_instance" "main" {
  replication_instance_id    = "main-dms-replication"
  engine_version             = "3.4.5"
  replication_instance_class = "dms.t2.micro"
  allocated_storage          = 5
  publicly_accessible        = true
  multi_az                   = false
  availability_zone          = var.region

  apply_immediately            = true
  auto_minor_version_upgrade   = false
  preferred_maintenance_window = "sun:10:30-sun:14:30"
  replication_subnet_group_id  = var.sg_dms_id

  tags = {
    Name = "${var.app_name}-main"
  }
}
