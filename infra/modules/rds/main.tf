resource "aws_db_subnet_group" "main" {
  name       = "${var.environment}-db-subnet-group"
  subnet_ids = var.subnet_ids

}








resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  identifier = "UserDB"
  username             = "tejas"
  password             = "tejas123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}

output "endpoint" {
  value = aws_db_instance.default.endpoint
}

resource "null_resource" "initialize_db" {
  provisioner "local-exec" {
    command = <<EOT
      mysql -h ${aws_db_instance.default.endpoint} -P 3306 -u tejas -ptejas123 UserDB < table
    EOT
    interpreter = ["/bin/sh", "-c"]
  }

  depends_on = [aws_db_instance.default]
}