resource "aws_dms_replication_task" "test" {
  replication_task_id      = "replication-main-task"
  target_endpoint_arn      = aws_dms_endpoint.target_endpoint.endpoint_arn
  source_endpoint_arn      = aws_dms_endpoint.source_endpoint.endpoint_arn
  replication_instance_arn = aws_dms_replication_instance.main.replication_instance_arn
  migration_type           = "full-load"
  table_mappings           = file("./modules/dms/dms_table_mapping.json")

  tags = {
    Name = "${var.app_name}-main"
  }
}
