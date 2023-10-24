module "s3_backend" {
  source = "./modules/s3-backend"  # Path to your S3 backend module

  # Pass variables required by the S3 backend module
  aws_region = var.aws_region
  bucket_name = "my-terraform-backend-bucket78ghgu"  # Set your desired bucket name
  bucket_acl = "private"
  sse_algorithm = "AES256"
  
  namespace = "eg"
  stage = "test"
  name = "terraform"

  
  default_tags = {
    "Environment" = "Test",
    "Project"     = "cloudsheger"
    infra_env         = var.infra_env
    infra_role        = var.infra_role
  }
}


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
