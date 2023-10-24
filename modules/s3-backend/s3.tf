data "aws_s3_bucket" "ztp-deployer-bucket" {
  bucket = "ztp-deployer-bucket" # Replace with the name of your existing S3 bucket
}

resource "aws_s3_bucket" "backend" {
  bucket = data.aws_s3_bucket.ztp-deployer-bucket.bucket # Use the existing bucket if it exists
  #tags = var.tags

    # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_public_access_block" "secure-backend" {
  bucket = aws_s3_bucket.backend.id
  restrict_public_buckets = true
  ignore_public_acls     = true
  block_public_policy    = true
}

resource "aws_s3_bucket_versioning" "versioning_backend" {
  bucket = aws_s3_bucket.backend.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_logging" "backend_logging" {
  bucket        = aws_s3_bucket.backend.bucket
  target_bucket = "ztp-deployer-bucket"
  target_prefix = "logs/"
}

resource "aws_s3_bucket_server_side_encryption_configuration" "backend_encryption" {
  bucket = aws_s3_bucket.backend.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.backend.bucket
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
