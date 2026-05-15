resource "aws_subnet" "subnet_kubernates_test" {
  vpc_id     = aws_vpc.vpc_kubernates_test.id
  cidr_block = aws_vpc.vpc_kubernates_test.cidr_block
  tags = {
    Name = "subnet | kubernates test"
  }
}
