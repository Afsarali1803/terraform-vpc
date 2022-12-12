provider "aws" {
    region = "us-east-1"  
}

terraform {
  backend "s3" {
    bucket = "b51-tf-remote-state-bucket-afs"
    key    = "vpc/dev/terraform.tfstate"
    region = "us-east-1"    
  }
}