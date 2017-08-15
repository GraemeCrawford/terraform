provider "aws" {
  region     = "eu-west-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0d063c6b"
  instance_type = "t2.micro"
}
