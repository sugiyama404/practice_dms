output "db_sbg_name" {
  value = aws_db_subnet_group.db-sg.name
}

output "sg_rds_id" {
  value = aws_security_group.rds_sg.id
}

output "sg_opmng_id" {
  value = aws_security_group.opmng_sg.id
}

output "subnet_public_subnet_1a_id" {
  value = aws_subnet.public_subnet_1a.id
}
