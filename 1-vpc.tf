resource "aws_vpc" "ginjo_vpc" {
  cidr_block       = "10.6.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name = "ginjo-vpc"
  }

  enable_dns_hostnames = true
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.ginjo_vpc.id
  service_name = "com.amazonaws.us-east-1.s3"
}
