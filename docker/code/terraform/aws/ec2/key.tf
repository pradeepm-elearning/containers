resource "tls_private_key" "tls_key_gen_docker_test" {
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "aws_key_pair" "ec2_key_pair_docker_test" {
    key_name = var.key_name
    public_key = tls_private_key.tls_key_gen_docker_test.public_key_openssh
}

resource "local_file" "pem_file_creation" {
    filename = pathexpand("~/practice/docker/terraform/aws/keys/ec2_tf_test-docker_test.pem")
    content = tls_private_key.tls_key_gen_docker_test.private_key_pem
    file_permission = 0400
}