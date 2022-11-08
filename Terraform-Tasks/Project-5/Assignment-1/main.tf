terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>4.0"
    }
    github = {
      source  = "integrations/github"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "ec2" {
  count = var.instance_count
  ami             = var.ami
  instance_type   = var.instance_type
  key_name        = var.key
  associate_public_ip_address = var.enable_public_ip
  
  security_groups = ["${aws_security_group.instance.name}"]
  tags = var.project_environment
}

resource "aws_iam_user" "developers" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

provider "github" {
  token = var.token-value
}

resource "github_repository" "terraform-assn-1" {
  name        = "terraform-assignment1"
  description = "My awesome codebase"
  visibility  = "public"
}

