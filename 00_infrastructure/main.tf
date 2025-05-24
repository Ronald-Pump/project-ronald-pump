provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name        = var.bucket_name
    Environment = "dev"
  }
}

# Create the initial folder inside the bucket
resource "aws_s3_object" "initial_folder" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "initial-pdf-dump/"  # The trailing slash indicates a folder
  acl    = "private"
}

# Create the 'haziq' subfolder inside 'initial-pdf-dump'
resource "aws_s3_object" "haziq_folder" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "initial-pdf-dump/haziq/"  # The trailing slash indicates a folder
  acl    = "private"
}

# Create the 'teh' subfolder inside 'initial-pdf-dump'
resource "aws_s3_object" "teh_folder" {
  bucket = aws_s3_bucket.my_bucket.bucket
  key    = "initial-pdf-dump/teh/"  # The trailing slash indicates a folder
  acl    = "private"
}