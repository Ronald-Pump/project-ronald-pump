output "s3_bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "s3_bucket_url" {
  value = aws_s3_bucket.my_bucket.website_endpoint
}