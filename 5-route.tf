resource "aws_route_table" "ginjo_pub_rtb" {
  vpc_id = aws_vpc.ginjo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ginjo_igw.id
  }

  tags = {
    Name    = "ginjo_pub_rtb"
    Service = "MyVPC"
  }
}

resource "aws_route_table_association" "pub_subnet_1a_rtb_assoc" {
  subnet_id      = aws_subnet.pub_subnet_1a.id
  route_table_id = aws_route_table.ginjo_pub_rtb.id
}

resource "aws_route_table_association" "pub_subnet_1b_rtb_assoc" {
  subnet_id      = aws_subnet.pub_subnet_1b.id
  route_table_id = aws_route_table.ginjo_pub_rtb.id
}

resource "aws_route_table" "ginjo_prv_rtb" {
  vpc_id = aws_vpc.ginjo_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ginjo_ngw.id
  }

  tags = {
    Name    = "ginjo_prv_rtb"
    Service = "MyVPC"
  }
}

resource "aws_route_table_association" "prv_subnet_1a_rtb_assoc" {
  subnet_id      = aws_subnet.prv_subnet_1a.id
  route_table_id = aws_route_table.ginjo_prv_rtb.id
}

resource "aws_route_table_association" "prv_subnet_1b_rtb_assoc" {
  subnet_id      = aws_subnet.prv_subnet_1b.id
  route_table_id = aws_route_table.ginjo_prv_rtb.id
}


