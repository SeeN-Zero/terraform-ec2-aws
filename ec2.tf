terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.6.2"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "ap-southeast-1" #Singapore
}

resource "aws_instance" "Aws-EC2-Terraform" {
  ami                    = "ami-0df7a207adb9748c7"    #Ubuntu 22.04 x86
  instance_type          = "t2.micro"                 #Free Tier
  key_name               = "MainEC2Key"               #Next Update Create Key Using tf
  subnet_id              = "subnet-0ae371d225f5b6efb" #Next Update Create Subnet Using tf
  vpc_security_group_ids = ["sg-07a52927c012524ff"]   #Next Update Create VPC Using tf
  root_block_device {
    volume_type = "gp2"
    volume_size = "8"
  }
  tags = {
    name = "Aws-EC2-Terraform"
  }
}

