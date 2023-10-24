terraform {
  backend "s3" {
    bucket         = "ztp-deployer-bucket"
    key            = "tf-state/terraform.tfstate"
    region         = "us-east-1" # Specify the appropriate AWS region for your S3 bucket
    encrypt        = true
    dynamodb_table = "terraform-lock-table" # Optional: Specify a DynamoDB table for state locking
  }
}
module "ec2_app" {
  source             = "./modules/ec2" # Path to your module directory
  instance_count   = var.instance_count
  
  infra_env          = var.infra_env
  infra_role         = var.infra_role
  aws_region         = var.aws_region     # Value for aws_region variable
  instance_type      = var.instance_type  # Value for instance_type variable
  key_name           = var.key_name       # Value for key_name variable
  subnet_id          = var.subnet_id      # Value for subnet_id variable
  instance_name      = var.instance_name
  security_groups    = var.security_groups

  tags = {
    infra_env         = var.infra_env
    infra_role        = var.infra_role
    Name              = var.instance_name
    Provisioner       = "ztp-deployer-terraform"
    clap_on           = "0 4 @ @ 1-5 @"
    clap_off          = "21:00"
  }
}
