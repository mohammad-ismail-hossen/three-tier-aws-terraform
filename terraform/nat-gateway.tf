resource "aws_eip" "nat-a" {
  domain = "vpc"

  tags = {
    Name = "project"
  }
}

resource "aws_nat_gateway" "natgw-a" {
  allocation_id = aws_eip.nat-a.id
  subnet_id     = aws_subnet.pubA.id

  tags = {
    Name = "project"
  }

  depends_on = [aws_internet_gateway.project-igw]
}

resource "aws_eip" "nat-b" {
  domain = "vpc"

  tags = {
    Name = "project"
  }
}

resource "aws_nat_gateway" "natgw-b" {
  allocation_id = aws_eip.nat-b.id
  subnet_id     = aws_subnet.pubB.id

  tags = {
    Name = "project"
  }

  depends_on = [aws_internet_gateway.project-igw]
}

resource "aws_eip" "nat-c" {
  domain = "vpc"

  tags = {
    Name = "project"
  }
}

resource "aws_nat_gateway" "natgw-c" {
  allocation_id = aws_eip.nat-c.id
  subnet_id     = aws_subnet.pubC.id

  tags = {
    Name = "project"
  }

  depends_on = [aws_internet_gateway.project-igw]
}