resource "aws_instance" "ec2" {
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key
  tags = {
    Name = "instance"
    }


provisioner "remote-exec" {
    script = "../Assignment-3/webserver/webserver-install.sh"
  }
    connection {
    type     = "ssh"
    user     = "ubuntu"
    host     = self.public_ip
    private_key = "${file("./webserver/virginia.pem")}"
  }
}
