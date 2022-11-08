terraform {
  # backend "s3" {
  #   bucket = "statefilecontains"
  #   key    = "Project-04/terraform.tfstate"
  #   region = "us-east-1"
  #}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "ansible-server" {
  source = "./virtual-machines"
}

module "s3_bucket" {
  source = "./virtual-machines/storage"
}

