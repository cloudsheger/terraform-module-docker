terraform {
  backend "s3" {
    bucket         = "ztp-deployer-bucket"
    key            = "cloudsheger-repo/terraform.tfstate"
    region         = "us-east-1" # Specify the appropriate AWS region for your S3 bucket
    encrypt        = true
    dynamodb_table = "terraform-lock-table" # Optional: Specify a DynamoDB table for state locking
  }
}