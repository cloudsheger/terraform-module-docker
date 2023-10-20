variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "Name of the EC2 Key Pair"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the EC2 instance will be launched"
  type        = string
}

variable "instance_name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable infra_env {
    type = string
    description = "infrastructure environment"
}
 
variable infra_role {
  type = string
  description = "infrastructure purpose"
}

variable "tags" {
  description = "A map of tags for the AWS resources."
  type        = map(string)
  default = {
    Name              = "deployer"
    Provisioner       = "ztp-deployer-terraform"
    clap_on           = "0 4 @ @ 1-5 @"
    clap_off          = "21:00"
  }
}