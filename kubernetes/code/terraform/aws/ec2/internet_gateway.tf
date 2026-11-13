resource "aws_internet_gateway" "ig_kubernates_test" {
  vpc_id   = aws_vpc.vpc_kubernates_test.id
  tags = {
    Name = "ig | kubernates Test"
  }
}