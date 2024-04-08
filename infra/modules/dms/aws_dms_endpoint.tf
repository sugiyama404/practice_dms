# source endpoint
resource "aws_dms_endpoint" "source_endpoint" {
  endpoint_id   = "source-endpoint"
  endpoint_type = "source"
  engine_name   = "mysql"

  username      = var.db_username
  password      = var.db_password
  port          = 3306
  server_name   = var.sorce_db_address # Host name of the server.
  database_name = var.db_name

  tags = {
    Name = "${var.app_name}-source-endpoint"
  }
}

# target endpoint
resource "aws_dms_endpoint" "target_endpoint" {
  endpoint_id   = "target-endpoint"
  endpoint_type = "target"
  engine_name   = "mysql"

  username      = var.db_username
  password      = var.db_password
  port          = 3306
  server_name   = var.target_db_address # Host name of the server.
  database_name = var.db_name

  tags = {
    Name = "${var.app_name}-target-endpoint"
  }
}
