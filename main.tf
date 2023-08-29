provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}
terraform {
  backend "s3" {
    bucket = "for-project-in-aip-terraform-deploy"
    key    = "remote.tfstate"
    region = "us-east-1"
  }
}
resource "aws_instance" "example" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"
}
