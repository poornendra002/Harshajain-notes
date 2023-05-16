data "aws_ami" "ubuntu" {
  most_recent = true
  owners = ["self"]
     
  filter {
    name   = "tag:Name"
    values = ["my-test-instance"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }   
}

resource "aws_instance" "ec2_provisioner" {
    ami = data.aws_ami.ubuntu.id
    instance_type = var.ec2_instance_type
    key_name = var.ec2_pem
    vpc_security_group_ids = ["${aws_security_group.ec2_sg.id}"]
    tags = {
        Name = "PROVISIONER"
    }
}

resource "aws_security_group" "ec2_sg" {
    name = "ec2_sg"
    description = "Allow ssh and http"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
    }
}