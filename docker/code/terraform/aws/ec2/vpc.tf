resource "aws_vpc" "vpc_docker_test" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "vpc | docker test"
  }
}
