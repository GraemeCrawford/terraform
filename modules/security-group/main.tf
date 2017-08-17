variable "source_port" {}
variable "source_cidr_block" {}

resource "aws_security_group" "allow_specific_ports" {
  name        = "allow_specific_ports"
  description = "Allow specified inbound traffic"

  ingress {
    from_port   = "${var.source_port}"
    to_port     = "${var.source_port}"
    protocol    = "TCP"
    cidr_blocks = [ "${var.source_cidr_block}" ]
    }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/16"]
  }
}
