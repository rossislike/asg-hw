resource "aws_eip" "ginjo_eip" {

  tags = {
    Name = "ginjo_eip"
  }
}

resource "aws_nat_gateway" "ginjo_ngw" {
  allocation_id = aws_eip.ginjo_eip.id
  subnet_id     = aws_subnet.pub_subnet_1a.id

  tags = {
    Name = "ginjo_ngw"
  }

  depends_on = [aws_internet_gateway.ginjo_igw]
}