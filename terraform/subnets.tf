data "aws_availability_zones" "available" {
  state = "available"
}

# Public
resource "aws_subnet" "pubA" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 1)
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "project"
  }
}

resource "aws_subnet" "pubB" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 2)
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "project"
  }
}

resource "aws_subnet" "pubC" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 3)
  availability_zone = data.aws_availability_zones.available.names[2]

  tags = {
    Name = "project"
  }
}

# Private

resource "aws_subnet" "appA" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 11)
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "project"
  }
}

resource "aws_subnet" "appB" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 12)
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "project"
  }
}

resource "aws_subnet" "appC" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 13)
  availability_zone = data.aws_availability_zones.available.names[2]


  tags = {
    Name = "project"
  }
}

# DB

resource "aws_subnet" "dbA" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 21)
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "project"
  }
}

resource "aws_subnet" "dbB" {
  vpc_id            = aws_vpc.project-vpc.id
  cidr_block        = cidrsubnet(var.vpc_cidr, 8, 22)
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "project"
  }
}

resource "aws_db_subnet_group" "project-dsg" {
  name       = "project-dsg"
  subnet_ids = [aws_subnet.dbA.id, aws_subnet.dbB.id]

  tags = {
    Name = "project"
  }
}