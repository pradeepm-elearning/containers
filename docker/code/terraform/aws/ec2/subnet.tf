resource "aws_subnet" "subnet_docker_test" {
  vpc_id     = aws_vpc.vpc_docker_test.id
  cidr_block = aws_vpc.vpc_docker_test.cidr_block
  tags = {
    Name = "subnet | docker test"
  }
}
