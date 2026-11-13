resource "aws_route_table_association" "rta_docker_test" {
  subnet_id = aws_subnet.subnet_docker_test.id
  route_table_id = aws_route_table.rt_docker_test.id
}
