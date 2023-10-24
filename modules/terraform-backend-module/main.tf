data "aws_iam_policy_document" "s3_bucket_policy" {
  statement {
    actions = [
      "s3:DeleteBucket",
      "s3:DeleteObject",
      "s3:DeleteObjectVersion",
    ]
    resources = [
      "arn:aws:s3:::${var.s3_bucket_name}",
      "arn:aws:s3:::${var.s3_bucket_name}/*",
    ]
    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
    effect = "Deny"
  }
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = var.s3_bucket_name
  #acl    = "private"
  tags   = var.default_tags
}

resource "aws_s3_bucket_policy" "attach_s3_policy" {
  bucket = aws_s3_bucket.s3_bucket.id
  policy = data.aws_iam_policy_document.s3_bucket_policy.json
}

resource "aws_s3_object" "upload_state" {
  bucket       = aws_s3_bucket.s3_bucket.id
  acl          = "private"
  source       = "terraform.tfstate"  # Path to your local .tfstate file
  key          = "terraform-backend/terraform.tfstate"
  content_type = "application/json"
  tags         = var.default_tags

  depends_on = [
    aws_s3_bucket.s3_bucket,
    aws_s3_bucket_policy.attach_s3_policy,
  ]
}


output "terraform_backend_s3_bucket_arn" {
  value = aws_s3_bucket.s3_bucket.arn
}

output "terraform_backend_s3_bucket_id" {
  value = aws_s3_bucket.s3_bucket.id
}
