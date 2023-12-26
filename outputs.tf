output "aws_s3_bucket_data" {
  description = "ID of the AWS bucket"
  value       = aws_s3_bucket.website
}

output "aws_s3_bucket_acl_data" {
  description = "ID of the AWS bucket acl data"
  value       = aws_s3_bucket_acl.website
}


output "aws_s3_bucket_configuration_data" {
  description = "ID of the AWS bucket configuration data"
  value       = aws_s3_bucket_website_configuration.website
}
