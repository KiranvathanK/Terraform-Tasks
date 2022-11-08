resource "aws_instance" "public-ec2" {

  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1
   
  ]
  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet1.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.WS-SG.id]

  tags = {
   Name = "Public-Instance"
  }
}

resource "aws_instance" "private-ec2" {

  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet2
 
  ]

  ami = var.ami
  instance_type = "t2.micro"
  subnet_id = aws_subnet.subnet2.id
  key_name = var.key_name
  vpc_security_group_ids = [aws_security_group.WS-SG.id]

  tags = {
   Name = "Private-Instance"
  }
}

