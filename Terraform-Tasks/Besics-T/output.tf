output "public_ip"{
    value = aws_instance.n1.*.public_ip

}
output "public_ip1"{
    value = aws_instance.ec2.public_ip
}