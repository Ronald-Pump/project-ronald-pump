provider "aws" {
  region = var.region
}


###################################################### For the S3 bucket structure ######################################################
resource "aws_s3_bucket" "my_bucket" {
  bucket      = var.bucket_name
  acl         = "private"

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}


# Create the initial-pdf-dump folder structure
resource "aws_s3_object" "initial_pdf_dump_folders" {
  for_each = toset([
    "initial-pdf-dump/",
    "initial-pdf-dump/haziq/",
    "initial-pdf-dump/teh/"
  ])

  bucket  = aws_s3_bucket.my_bucket.bucket
  key     = each.value
  content = "" # Empty content to create folder structure
  acl     = "private"
}

# Create the evolt-scan folder structure
resource "aws_s3_object" "evolt_scan_folders" {
  for_each = toset([
    "evolt-scan/",
    "evolt-scan/input/",
    "evolt-scan/output/",
    "evolt-scan/input/haziq/",
    "evolt-scan/input/teh/",
    "evolt-scan/output/haziq/",
    "evolt-scan/output/teh/"
  ])

  bucket  = aws_s3_bucket.my_bucket.bucket
  key     = each.value
  content = "" # Empty content to create folder structure
  acl     = "private"
}

###################################################### For the Lambda structure ######################################################
resource "aws_iam_role" "lambda_exec_role" {
  name = "lambda-exec-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_lambda_function" "bia_extractor" {
  function_name    = "bia-extractor"
  runtime          = "python3.11"
  handler          = "lambda_function.lambda_handler" # Matches the file and function name in your Lambda code
  role             = aws_iam_role.lambda_exec_role.arn
  filename         = "${path.module}/../01_lambda/lambda_package.zip" # Points to the zip file in the 01_lambda folder
  source_code_hash = filebase64sha256("${path.module}/../01_lambda/lambda_package.zip") # Ensures Terraform detects changes
  timeout          = 60
  memory_size      = 512
}