variable "aws_region" {
  type        = string
  description = "The AWS region to put the bucket into"
}

variable "aws_access_key" {
  type        = string
  description = "AWS access key"
}

variable "aws_secret_key" {
  type        = string
  description = "AWS secret key"
}

variable "aws_bucket_name" {
  type        = string
  description = "AWS S3 bucket name"
}

# variable "site_domain" {
#   type        = string
#   description = "The domain name to use for the static site"
# }

# variable "cloudflare_api_token" {
#   type        = string
#   description = "Cloudflare API token"
# }
