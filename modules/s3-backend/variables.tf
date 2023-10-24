variable "aws_region" {
  description = "AWS region where the S3 bucket will be created."
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "Name of the S3 bucket for Terraform backend."
}

variable "bucket_acl" {
  description = "Canned ACL to apply to the S3 bucket."
  default     = "private"
}

variable "sse_algorithm" {
  description = "Server-side encryption algorithm to use for the S3 bucket."
  default     = "AES256"
}

variable "namespace" {
  description = "A namespace to identify your organization or project."
}

variable "stage" {
  description = "The deployment stage (e.g., dev, test, prod)."
}

variable "name" {
  description = "A general name for your infrastructure."
}

variable "enable_prevent_destroy" {
  description = "Enable or disable prevent_destroy."
  type        = bool
  default     = false
}

variable "default_tags" {
  description = "Default tags to apply to the S3 bucket."
  type        = map(string)
  default     = {}
}
