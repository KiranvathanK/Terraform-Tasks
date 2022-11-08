terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>4.0"
    }
     github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "aws"{
    region = "us-east-1"
}

provider "github" {
  token = "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"
}

module "webserver"{
    source = "../Assignment-3/webserver"
}

module "github-clone"{
  source = "git::https://github.com/KiranvathanK/ec2-install-git_Module.git"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "my-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "development"
  }
} 