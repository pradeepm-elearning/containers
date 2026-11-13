resource "aws_internet_gateway" "ig_docker_test" {
  vpc_id   = aws_vpc.vpc_docker_test.id
  tags = {
    Name = "ig | docker Test"
  }
}