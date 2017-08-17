provider "aws" {
## Set these if you have them set in a variables.tf file
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

###
# Create an AWS resrource - virtual machine (instance) named example and use the AMI ID for Centos 7 and instance type t2.micro which qualifies for free tier.
###
resource "aws_instance" "example" {
  ami           = "ami-0d063c6b"
  instance_type = "t2.micro"
}

resource "aws_eip" "ip" {
  instance = "${aws_instance.example.id}"
}

output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
