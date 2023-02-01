# You should change the bucket name. S3 bucket name are  globally unique

variable "environment" {
  type        = string
  description = "Current Environment"
  default     = "dev"
}