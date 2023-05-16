output "ec2_public_ip" {
  value = aws_instance.ec2_provisioner.public_ip
  sensitive = true
}