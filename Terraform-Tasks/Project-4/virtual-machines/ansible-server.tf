locals {
    tags ={ 
        name ="Ansible_server"
    }
}

resource "aws_instance" "ansible"{
    ami = var.redhat
    instance_type = var.instance_type
    security_groups = ["${aws_security_group.ansible.name}"]
    key_name = var.keypair

    user_data = "${file("./virtual-machines/userdata.sh")}"
    
    tags = local.tags
}
