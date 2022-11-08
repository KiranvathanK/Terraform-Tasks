terraform {
    # backend "s3"{
    #     bucket = "project2statefilestore"
    #     key = "terraform.tfstate"
    #     force_destroy = true
    # }
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~>4.0"
      }
    }
}

provider "aws"{
    region = "us-west-2"
}

resource "aws_instance" "ec2"{
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.keypair
    security_groups = ["${aws_security_group.ssh.name}"]

    tags = {
        Name = "Ansible-Server" 
    }
}

resource "aws_instance" "n1"{
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.keypair
    security_groups = ["${aws_security_group.ssh.name}"]

    tags = {
        Name = "node1" 
    }
}

resource "aws_instance" "n2"{
    ami = var.ami
    instance_type = var.instance_type
    key_name = var.keypair
    security_groups = ["${aws_security_group.ssh.name}"]

    tags = {
        Name = "node2" 
    }
}

resource "aws_security_group" "ssh" {
  name = "ssh"
  description = "ssh Security Group"

  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
} 
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
} 
  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
} 
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  } 
}  

resource "aws_s3_bucket" "bucket"{
    bucket = "project2statefilestore"
    force_destroy = true
    
}