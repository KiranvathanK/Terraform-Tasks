terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~>4.0"
        }
    }
}

provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
  count = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key
  tags = {
    Name="server ${count.index}"
  }
}

