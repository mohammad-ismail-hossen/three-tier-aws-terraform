# ALB
resource "aws_security_group" "alb-sg" {
  name        = "alb-sg"
  description = "Security group for alb"
  vpc_id      = aws_vpc.project-vpc.id

  tags = {
    Name = "project"
  }
}

resource "aws_vpc_security_group_ingress_rule" "alb_http_in" {
  security_group_id = aws_security_group.alb-sg.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "alb_out_app" {
  security_group_id            = aws_security_group.alb-sg.id
  from_port                    = 80
  ip_protocol                  = "tcp"
  to_port                      = 80
  referenced_security_group_id = aws_security_group.app-sg.id
}

# APP

resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "Security group for app instances"
  vpc_id      = aws_vpc.project-vpc.id

  tags = {
    Name = "project"
  }
}

resource "aws_vpc_security_group_ingress_rule" "app_in" {
  security_group_id            = aws_security_group.app-sg.id
  ip_protocol                  = "tcp"
  from_port                    = 80
  to_port                      = 80
  referenced_security_group_id = aws_security_group.alb-sg.id
}

resource "aws_vpc_security_group_egress_rule" "app_out_db" {
  security_group_id            = aws_security_group.app-sg.id
  ip_protocol                  = "tcp"
  from_port                    = 3306
  to_port                      = 3306
  referenced_security_group_id = aws_security_group.db-sg.id
}

resource "aws_vpc_security_group_egress_rule" "app_out_nat" {
  security_group_id = aws_security_group.app-sg.id
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
  cidr_ipv4         = "0.0.0.0/0"
}

# DB
resource "aws_security_group" "db-sg" {
  name        = "db-sg"
  description = "Allow MySQL inbound traffic from app instances"
  vpc_id      = aws_vpc.project-vpc.id

  tags = {
    Name = "project"
  }
}

resource "aws_vpc_security_group_ingress_rule" "db-in" {
  security_group_id            = aws_security_group.db-sg.id
  ip_protocol                  = "tcp"
  from_port                    = 3306
  to_port                      = 3306
  referenced_security_group_id = aws_security_group.app-sg.id
}