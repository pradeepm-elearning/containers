resource "aws_route_table_association" "rta_kubernates_test" {
  subnet_id = aws_subnet.subnet_kubernates_test.id
  route_table_id = aws_route_table.rt_kubernates_test.id
}
