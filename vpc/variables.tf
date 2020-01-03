variable "service" {
  description = "The name of the service"
  type        = string
}

variable "aws_region" {
  description = "The AWS region"
  type        = string
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  default     = "10.1.0.0/16"
}

variable "cidr_subnet_a" {
  description = "CIDR block for the VPC"
  default     = "10.1.1.0/24"
}

variable "cidr_subnet_b" {
  description = "CIDR block for the VPC"
  default     = "10.1.2.0/24"
}

variable "cidr_subnet_c" {
  description = "CIDR block for the VPC"
  default     = "10.1.32.0/20"
}

variable "cidr_subnet_d" {
  description = "CIDR block for the VPC"
  default     = "10.1.48.0/20"
}

variable "availability_zone_a" {
  description = "The availability zone of subnet A (depends on the AWS region)"
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "The availability zone of subnet B (depends on the AWS region)"
  default     = "us-east-1b"
}

variable "availability_zone_c" {
  description = "The availability zone of subnet C (depends on the AWS region)"
  default     = "us-east-1a"
}

variable "availability_zone_d" {
  description = "The availability zone of subnet D (depends on the AWS region)"
  default     = "us-east-1b"
}
