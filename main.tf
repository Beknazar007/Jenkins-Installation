provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-051f7e7f6c2f40dc1"
  instance_type = "t2.micro"

  tags = {
    Name = "MyExampleInstance"
  }
}
