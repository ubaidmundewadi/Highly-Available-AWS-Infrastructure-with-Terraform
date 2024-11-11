terraform {
  backend "s3" {
    bucket = "terraform-backend-prod-11-11"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}