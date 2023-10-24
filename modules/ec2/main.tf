provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "example" {
  count           = var.instance_count
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  subnet_id       = var.subnet_id
  security_groups = var.security_groups
  key_name        = var.key_name
  
  tags = var.tags
}

data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"]  # Canonical Ubuntu official account ID

  filter {
    name = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}
