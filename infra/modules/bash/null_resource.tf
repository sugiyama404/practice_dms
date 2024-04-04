resource "null_resource" "default" {
  triggers = {
    rds_instance_id = "${var.sorce_db_id}"
  }

  provisioner "local-exec" {
    command = "mysql -h ${var.sorce_db_address} -u${var.db_username} -p${var.db_password} -D${var.db_name} < init.sql"
  }
}
