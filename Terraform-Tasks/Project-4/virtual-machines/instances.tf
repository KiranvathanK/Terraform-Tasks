resource "aws_instance" "Target"{
    count = 2
    ami = var.ubuntu
    instance_type = var.instance_type
    security_groups = ["${aws_security_group.ansible.name}"]
    key_name = var.keypair

    tags ={
        Name = "ubuntu ${count.index}"
    }
}



resource "aws_instance" "Target1"{
    count = 2
    ami = var.redhat
    instance_type = var.instance_type
    security_groups = ["${aws_security_group.ansible.name}"]
    key_name = var.keypair

    tags ={
        Name = "redhat ${count.index}"
    }
}

