terraform {
  required_version = ">= 1.1.0" # for proper handling of moved resources

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.9.0"
    }
  }
}