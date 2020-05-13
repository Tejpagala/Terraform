provider "aws" {
  
}


terraform {
  backend "s3" {
    bucket = "tej-project"
    key    = "tej-project/sample"
    region = "us-east-1"
  }
}