variable "ami" {
  default = "ami-08c40ec9ead489470"
  type    = string
}

variable "instance_type"{
 default = "t2.micro"
 type = string
}

variable "key" {
  default = "virginia"
  type    = string
}

variable "instance_count" {
  description = "EC2 instance count"
  type        = number
  default     = 2
}