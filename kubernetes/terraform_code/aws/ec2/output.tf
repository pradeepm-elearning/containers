output "kubernates-output" {
  value = aws_instance.ec2_kubernates_test.public_ip
  description = "Public IP for the AWS"
}
