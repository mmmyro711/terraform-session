terraform {
    backend "s3" {
        bucket = "terraform-session-jan-backend-myroslav"
        key = "project/dev/terraform.tfstate"      
        region = "us-east-1"
      
    }
}