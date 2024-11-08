resource "aws_vpc" "ginjo_vpc" {
  cidr_block       = "10.6.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name    = "ginjo_vpc"
    Service = "MyASG"
  }

  enable_dns_hostnames = true
}

resource "aws_vpc_endpoint" "gingjo_vpce_s3" {
  vpc_id       = aws_vpc.ginjo_vpc.id
  service_name = "com.amazonaws.us-east-1.s3"

  route_table_ids = [aws_route_table.ginjo_pub_rtb.id, aws_route_table.ginjo_prv_rtb.id]
  tags = {
    Name    = "gingjo_vpce_s3"
    Service = "MyASG"
  }
}
