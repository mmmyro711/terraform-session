terraform {
  backend "s3" {
    bucket = "terraform-session-jan-backend-myroslav"
    key    = "session-7/terraform.tfstate" //Path to your Remote Backend File (terraform.tfstate)
    region = "us-east-1"

  }
}