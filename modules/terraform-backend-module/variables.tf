variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "default_tags" {
  description = "Default tags for resources"
  type        = map(string)
  default     = {}
}
