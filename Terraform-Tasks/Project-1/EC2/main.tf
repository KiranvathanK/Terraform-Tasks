terraform {
    required_providers {
        aws ={
            source = "hashicorp/aws"
            version = "~>3"
        }
    }
}

provider "aws"{
    region = "us-east-1"
}

#this below code for launching a instance
resource "aws_instance" "Terraform-server" {
    ami = "ami-06640050dc3f556bb"
    instance_type = "t2.micro"
    #security_groups = ["${aws_security_group.web-node.name}"]
    
#     tags = {
#     Name = "Terraform-server"
# }
}

# resource "aws_security_group" "web-node" {
#   name = "web-node"
#   description = "Web Security Group"
#   ingress {
#     from_port = 80
#     to_port = 80
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
#   ingress {
#     from_port = 22
#     to_port = 22
#     protocol = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }    
#   egress {
#     from_port = 0
#     to_port = 0
#     protocol = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }