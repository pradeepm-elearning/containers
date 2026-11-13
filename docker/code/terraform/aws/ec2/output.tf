output "docker-output" {
  value = aws_instance.ec2_docker_test.public_ip
  description = "Public IP for the AWS"
}
