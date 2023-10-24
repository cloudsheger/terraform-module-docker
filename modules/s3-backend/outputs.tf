
output "s3_bucket_arn" {
  description = "The Amazon Resource Name (ARN) of the created S3 bucket."
  value       = aws_s3_bucket.terraform_backend.arn
}

output "s3_bucket_name" {
  description = "The name of the created S3 bucket."
  value       = aws_s3_bucket.terraform_backend.bucket
}
