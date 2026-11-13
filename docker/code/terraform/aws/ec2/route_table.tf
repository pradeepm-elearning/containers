resource "aws_route_table" "rt_kubernates_test" {
  vpc_id = aws_vpc.vpc_kubernates_test.id
  tags = {
    Name = "rt | kubernates_test"
  }
  route {
    cidr_block = aws_vpc.vpc_kubernates_test.cidr_block
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_kubernates_test.id
  }
}
