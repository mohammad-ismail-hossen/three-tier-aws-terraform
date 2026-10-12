resource "aws_db_instance" "project-db" {
  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  db_subnet_group_name   = aws_db_subnet_group.project-dsg.name
  vpc_security_group_ids = [aws_security_group.db-sg.id]
  multi_az               = true
  publicly_accessible    = false
  storage_encrypted      = true

  tags = {
    Name = "project"
  }
}