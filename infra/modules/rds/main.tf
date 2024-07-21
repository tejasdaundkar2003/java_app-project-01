resource "aws_db_instance" "default" {
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "mysql"
  engine_version    = "8.0"
  instance_class    = "db.t2.micro"
  identifier           = "mydb"
  username          = var.db_username
  password          = var.db_password
  vpc_security_group_ids = [aws_security_group.default.id]
  db_subnet_group_name   = aws_db_subnet_group.default.name

  tags = {
    Name = "mydb-instance"
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "default"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "default-db-subnet-group"
  }
}

output "endpoint" {
  value = aws_db_instance.default.endpoint
}
