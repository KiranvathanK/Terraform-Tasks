resource "aws_subnet" "subnet1" {
  depends_on = [
    aws_vpc.custom
  ]

  vpc_id = aws_vpc.custom.id
  cidr_block = "192.168.0.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
}