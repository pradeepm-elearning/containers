resource "aws_instance" "ec2_docker_test" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name        = "ec2 | docker | full test"
    Description = "This instance was created using Terraform for docker Testing"
  }
  vpc_security_group_ids =[aws_security_group.sg_ssh_ingress_docker_test.id, aws_security_group.sg_egress_docker_test.id, aws_security_group.sg_docker_ingress_docker_test.id]
  key_name = aws_key_pair.ec2_key_pair_docker_test.key_name
  subnet_id = aws_subnet.subnet_docker_test.id
  associate_public_ip_address = true
  user_data = file("userdata.sh")
}
