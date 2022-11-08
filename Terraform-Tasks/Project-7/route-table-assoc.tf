resource "aws_route_table_association" "RT-IG-Association" {

  depends_on = [
    aws_vpc.custom,
    aws_subnet.subnet1,
    aws_subnet.subnet2,
    aws_route_table.Public-Subnet-RT
  ]
  
  subnet_id      = aws_subnet.subnet1.id
  route_table_id = aws_route_table.Public-Subnet-RT.id
}