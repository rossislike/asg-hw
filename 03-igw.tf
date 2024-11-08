resource "aws_internet_gateway" "ginjo_igw" {
  vpc_id = aws_vpc.ginjo_vpc.id

  tags = {
    Name = "ginjo_igw"
  }
}