output "public_ip"{
    value = aws_instance.public-ec2.public_ip
}

output "private_ip"{
    value = aws_instance.private-ec2.private_ip
}