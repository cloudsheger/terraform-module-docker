module "ec2_app" {
  source             = "./modules/ec2" # Path to your module directory
  
  infra_env          = var.infra_env
  infra_role         = var.infra_role
  aws_region         = var.aws_region     # Value for aws_region variable
  instance_type      = var.instance_type  # Value for instance_type variable
  key_name           = var.key_name       # Value for key_name variable
  subnet_id          = var.subnet_id      # Value for subnet_id variable
  instance_name      = var.instance_name 

  tags = {
    infra_env         = var.infra_env
    infra_role        = var.infra_role
  }
}
