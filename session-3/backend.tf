terraform {
    backend "s3" {
        bucket = "terraform-session-jan-backend-myroslav"
        key = "session-3/terraform.tfstate"      //Path to your Remote Backend File (terraform.tfstate)
        region = "us-east-1"
      
    }
}