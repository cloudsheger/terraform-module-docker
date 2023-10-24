resource "aws_s3_bucket" "terraform_backend" {
  bucket = var.bucket_name
  acl    = var.bucket_acl

  versioning {
    enabled = true
  }

  lifecycle {
    prevent_destroy = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = var.sse_algorithm
      }
    }
  }

  tags = merge(var.default_tags, {
    "Namespace" = var.namespace,
    "Stage"     = var.stage,
    "Name"      = var.name
  })
}