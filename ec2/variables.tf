variable "instance_count" {
  description = "The amount of instance ec2"
  type        = number
}

variable "service" {
  description = "The name of the service"
  type        = string
}

variable "subnet_id" {
  description = "The subnet id correspondent to ec2"
  type        = list
}

variable "vpc_id" {
  description = "The vpc id"
  type        = string
}




