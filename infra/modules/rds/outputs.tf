# output "sorce_db_endpoint" {
#   value = aws_db_instance.source-db.endpoint
# }

output "sorce_db_id" {
  value = aws_db_instance.source-db.id
}

output "sorce_db_address" {
  value = split(":", "${aws_db_instance.source-db.address}")[0]
}

output "target_db_address" {
  value = split(":", "${aws_db_instance.target-db.address}")[0]
}
