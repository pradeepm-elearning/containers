resource "aws_route_table" "rt_docker_test" {
  vpc_id = aws_vpc.vpc_docker_test.id
  tags = {
    Name = "rt | docker_test"
  }
  route {
    cidr_block = aws_vpc.vpc_docker_test.cidr_block
    gateway_id = "local"
  }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig_docker_test.id
  }
}
