resource "aws_instance" "ec2_kubernates_test" {
  ami = "ami-03d49b144f3ee2dc4"
  instance_type = "t2.medium"
  tags = {
    Name = "ec2 | kubernates | full test"
    Description = "This instance was created using Terraform for kubernates Testing"
  }
  vpc_security_group_ids =[aws_security_group.sg_ssh_ingress_kubernates_test.id, aws_security_group.sg_egress_kubernates_test.id, aws_security_group.sg_kubernates_ingress_kubernates_test.id]
  key_name = aws_key_pair.ec2_key_pair_kubernates_test.key_name
  subnet_id = aws_subnet.subnet_kubernates_test.id
  associate_public_ip_address = true
  user_data = file("userdata.sh")
}
