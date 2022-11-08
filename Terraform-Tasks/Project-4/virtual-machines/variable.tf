variable "ubuntu" {
    default = "ami-08c40ec9ead489470"
    type = string
}

variable "redhat" {
    default ="ami-06640050dc3f556bb"
    type = string
}

variable "instance_type" {
    default = "t2.micro"
    type = string
}

variable "keypair" {
    default = "virginia"
}


