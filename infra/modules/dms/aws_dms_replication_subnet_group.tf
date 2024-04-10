# Create a new replication subnet group
resource "aws_dms_replication_subnet_group" "main" {
  replication_subnet_group_description = "replication subnet group"
  replication_subnet_group_id          = "dms-replication-subnet-group"
  subnet_ids = [
    "${var.subnet_private_subnet_1a_id}",
    "${var.subnet_private_subnet_1c_id}",
  ]

  tags = {
    Name = "${var.app_name}-main"
  }

  depends_on = [var.iam_role_policy_attachment_dms_policy]
}
