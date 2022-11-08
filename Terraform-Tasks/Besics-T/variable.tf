variable "ami"{
   default = "ami-08c40ec9ead489470"
   type = string
}

variable "instance_type"{
    default = "t2.micro"
    type = string
}

variable "keypair"{
    default = "virginia"
    type = string
}