provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

locals {
  service = "ServerWeb"
}

module "ec2" {
  source = "./ec2"
  instance_count = 2
  service = local.service
}