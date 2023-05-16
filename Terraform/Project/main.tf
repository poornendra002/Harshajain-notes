module "aws_s3_create" {
    source = "./modules/s3_bucket"
    bucket_name = var.root_module_s3_name
}

module "dynamo_db_create" {
    source = "./modules/DynamoDB"
    hash_key = var.root_module_hash_key
    dynamodb_name = var.root_module_dynamodb_name
}

module "ec2_create" {
    source = "./modules/ec2"
    ec2_ami = "ami-0597375488017747e"
    ec2_instance_type = "t2.micro"
    ec2_pem = "devops-october"
}

module "ec2_file_copy_provisioner" {
    source = "./modules/file"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "ec2_remote_exec_provisioner" {
    source = "./modules/remote-exec"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "ec2_local_exec_provisioner" {
    source = "./modules/local-exec"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}