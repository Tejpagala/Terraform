provider "aws" {
  
}


terraform {
  backend "s3" {
    bucket = "tej-project"
    key    = "PROJECT/terraform.tfstate"
    region = "us-east-1"
  }
}