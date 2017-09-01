#######
# AWS #
#######

provider "aws" {
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_key}"
  region = "${var.aws_region}"
}

##################
# Security Group #
##################

resource "aws_security_group" "rvg_test" {
  name = "rvg_test"
  description = "default VPC security group"

  # SSH access anywhere
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # SSH access anywhere
  egress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access anywhere
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # HTTP access anywhere
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

############
# Key Pair #
############

resource "aws_key_pair" "my_pub" {
  key_name = "my_pub"
  public_key = "${var.public_key}"
}

#############
# Instances #
#############

resource "aws_instance" "server" {
  ami = "${var.redhat_7}"
  instance_type = "t2.micro"
  key_name = "my_pub"
  security_groups = ["${aws_security_group.rvg_test.id}"]
  root_block_device {
    volume_type = "standard"
    volume_size = 80
  }
}

resource "aws_instance" "client" {
  ami = "${var.redhat_7}"
  instance_type = "t2.micro"
  key_name = "my_pub"
  security_groups = ["${aws_security_group.rvg_test.id}"]
}

#provisioner "local-exec" {
#    command = "cd .. && ansible-playbook --inventory-file=/etc/ansible/ec2.py -l key_rvg-inbox-test -e 'aws_access_key=${var.access_key} aws_secret_key=${var.secret_key}' provisioning/playbook.yml -vvvv"
#}
