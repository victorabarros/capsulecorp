provider "aws" {
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
  region     = var.aws_region
}

# Create a bucket
resource "aws_s3_bucket" "website" {
  bucket = var.aws_bucket_name
}

# Configure bucket
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.website.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "website" {
  bucket = aws_s3_bucket.website.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_ownership_controls" "website" {
  bucket = aws_s3_bucket.website.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "website" {
  bucket     = aws_s3_bucket.website.id
  acl        = "public-read"
  depends_on = [aws_s3_bucket_ownership_controls.website]
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource = [
          aws_s3_bucket.website.arn,
          "${aws_s3_bucket.website.arn}/*",
        ]
      },
    ]
  })
}

# Upload a file
resource "aws_s3_object" "file" {
  bucket = aws_s3_bucket.website.id

  acl    = "private" #todo public-read
  key    = "index.html"
  source = "./index.html"
}
