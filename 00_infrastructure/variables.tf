variable "region" {
  type        = string
  description = "AWS region"
  default     = "ap-southeast-5"
}

variable "aws_profile" {
  type        = string
  description = "AWS CLI profile name"
  default     = "default"
}

variable "bucket_name" {
  type        = string
  description = "S3 bucket name"
}
