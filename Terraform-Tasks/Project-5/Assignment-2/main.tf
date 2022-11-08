terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws"{
    region = "us-east-1"
}

resource "aws_instance" "ansible" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key
  tags = {
    Name = "ansible"
}


provisioner "file" {
      source = "../Assignment-2/httpd-playbook.yml"
      destination = "/home/ubuntu/httpd-playbook.yml"
    }

provisioner "remote-exec" {
    script = "../Assignment-2/installAnsible-Aplay.sh"
  }
   
connection {
    type     = "ssh"
    user     = "ubuntu"
    host     = self.public_ip
    private_key = "${file("virginia.pem")}"
  }
}

resource "aws_instance" "nod1" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key
  tags = {
    Name = "aws_instance-node1"
}

}







