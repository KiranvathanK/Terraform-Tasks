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

variable "vpc_name" {
  description = "terraform-VPC"
  type        = string
  default     = "terrform-VPC"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT gateway for VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "dev"
  }
}


