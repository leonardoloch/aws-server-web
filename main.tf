provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

data "aws_region" "current" {}

locals {
  service = "ServerWeb"
  aws_region = data.aws_region.current.name
}


module "ec2" {
  source = "./ec2"
  instance_count = 1
  service = local.service
  subnet_id = module.vpc.this_subnet_ids
  vpc_id = module.vpc.this_vpc_id
}

module "vpc" {
  source     = "./vpc"
  service    = local.service
  aws_region = local.aws_region
}
