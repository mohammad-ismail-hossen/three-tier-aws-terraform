# Public rt
resource "aws_route_table" "project-pub-rt" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project-igw.id
  }

  tags = {
    Name = "project"
  }
}

resource "aws_route_table_association" "pubA" {
  subnet_id      = aws_subnet.pubA.id
  route_table_id = aws_route_table.project-pub-rt.id
}

resource "aws_route_table_association" "pubB" {
  subnet_id      = aws_subnet.pubB.id
  route_table_id = aws_route_table.project-pub-rt.id
}

resource "aws_route_table_association" "pubC" {
  subnet_id      = aws_subnet.pubC.id
  route_table_id = aws_route_table.project-pub-rt.id
}

# Private rt

resource "aws_route_table" "appA-rt" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw-a.id
  }

  tags = {
    Name = "project"
  }
}

resource "aws_route_table_association" "appA" {
  subnet_id      = aws_subnet.appA.id
  route_table_id = aws_route_table.appA-rt.id
}

resource "aws_route_table" "appB-rt" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw-b.id
  }

  tags = {
    Name = "project"
  }
}

resource "aws_route_table_association" "appB" {
  subnet_id      = aws_subnet.appB.id
  route_table_id = aws_route_table.appB-rt.id
}

resource "aws_route_table" "appC-rt" {
  vpc_id = aws_vpc.project-vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natgw-c.id
  }

  tags = {
    Name = "project"
  }
}

resource "aws_route_table_association" "appC" {
  subnet_id      = aws_subnet.appC.id
  route_table_id = aws_route_table.appC-rt.id
}

# DB rt

resource "aws_route_table" "dbA-rt" {
  vpc_id = aws_vpc.project-vpc.id

  tags = {
    Name = "project"
  }
}

resource "aws_route_table_association" "dbA" {
  subnet_id      = aws_subnet.dbA.id
  route_table_id = aws_route_table.dbA-rt.id
}

resource "aws_route_table" "dbB-rt" {
  vpc_id = aws_vpc.project-vpc.id

  tags = {
    Name = "project"
  }
}

resource "aws_route_table_association" "dbB" {
  subnet_id      = aws_subnet.dbB.id
  route_table_id = aws_route_table.dbB-rt.id
}