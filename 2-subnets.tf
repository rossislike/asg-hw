resource "aws_subnet" "pub_subnet_1a" {
  vpc_id            = aws_vpc.ginjo_vpc.id
  cidr_block        = "10.6.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "pub_subnet_1a"
  }
}

resource "aws_subnet" "prv_subnet_1a" {
  vpc_id            = aws_vpc.ginjo_vpc.id
  cidr_block        = "10.6.11.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prv_subnet_1a"
  }
}

resource "aws_subnet" "pub_subnet_1b" {
  vpc_id            = aws_vpc.ginjo_vpc.id
  cidr_block        = "10.6.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "pub_subnet_1b"
  }
}

resource "aws_subnet" "prv_subnet_1b" {
  vpc_id            = aws_vpc.ginjo_vpc.id
  cidr_block        = "10.6.12.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prv_subnet_1b"
  }
}

