terraform {
   required_version = "~>1.3.7"
   
   required_providers {
     aws = {
        version = ">= 4.51.0"
     }
   }  

   backend "s3" {
    bucket = "my-s3-bucket-backed-end-9987898"
    key    = "project/terraform.tfstate"
    region = "ap-south-1"
   }

}