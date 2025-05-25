###################################################### For the S3 bucket structure ######################################################
output "s3_bucket_id" {
  value = aws_s3_bucket.my_bucket.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.my_bucket.arn
}

output "s3_bucket_url" {
  value = aws_s3_bucket.my_bucket.website_endpoint
}


###################################################### For the Lambda structure ######################################################
output "lambda_function_arn" {
  description = "The ARN of the Lambda function"
  value       = aws_lambda_function.bia_extractor.arn
}

output "lambda_function_name" {
  description = "The name of the Lambda function"
  value       = aws_lambda_function.bia_extractor.function_name
}