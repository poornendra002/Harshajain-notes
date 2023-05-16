resource "null_resource" "file_copy" {
    connection {
        type = "ssh"
        user = var.ec2_user
        agent = false
        host = "${var.ec2_public_ip}"
        private_key = file("keys/devops-october.pem")
    }

    provisioner "file" {
        source      = "conf/test.txt"
        destination = "/home/ubuntu/test.txt"
    }

}