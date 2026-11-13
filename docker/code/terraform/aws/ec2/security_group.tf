resource "aws_security_group" "sg_ssh_ingress_kubernates_test" {
  name = "sg_ssh-access-test"
  description = "This SG was created using Terraform for kubernates Test"
  vpc_id = aws_vpc.vpc_kubernates_test.id
  ingress {
    description = "SSH Access"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SSH Access"
  }
}

resource "aws_security_group" "sg_kubernates_ingress_kubernates_test" {
  name = "sg_kubernates-ingress-test"
  description = "This SG was created using Terraform for kubernates Test"
  vpc_id = aws_vpc.vpc_kubernates_test.id
  ingress {
    description = "kubernates Inbound"
    from_port = 9092
    to_port = 9092
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "SG | kubernates | Inbound"
  }
}


resource "aws_security_group" "sg_egress_kubernates_test" {
    name = "sg_outbound_allow"
    description = "This Security Group was created using Terraform"
    vpc_id = aws_vpc.vpc_kubernates_test.id
    egress {
        description = "Outbound Desc"
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "SG | Outbound Access"
    }
}
