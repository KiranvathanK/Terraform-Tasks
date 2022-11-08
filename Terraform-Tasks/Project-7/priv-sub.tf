resource "aws_subnet" "subnet2" {
  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1
  ]
  vpc_id = aws_vpc.custom.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1b"
  
  tags = {
    Name = "Private Subnet"
  }
}