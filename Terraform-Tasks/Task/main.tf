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
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[count.index]
  tags = {
    Name="server ${count.index}"
  }
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.14.0"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.vpc_azs
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway = var.vpc_enable_nat_gateway

  tags = var.vpc_tags
}