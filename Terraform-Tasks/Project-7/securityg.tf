resource "aws_security_group" "WS-SG" {

  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1,
    aws_subnet.subnet2
  ]

  name = "webserver-sg"
  vpc_id = aws_vpc.custom.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "output from webserver"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}