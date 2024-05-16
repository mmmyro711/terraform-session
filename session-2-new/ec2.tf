resource "aws_instance" "web" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-session-instance"
  }
}
// Each Terraform configaration file has .tf extension

//  There are 2 mains blocks in Terraform:
// * Resource Block = Create and Manage Resources (AWS Services or Infrastructure)
//      - Resource Block expects 2 labels
// * Data Source Block = ?


//  Syntax:
// * resource = block
// * aws_instance = first_label, (resource type), predefined by Terraform 
// * web = second_label, (logical name or logical ID), defined by User(me, author)
// * ami = argument, consists of Key/Value(Name/Value), configurations of the resource 
    //   - Key = predefined by Terraform
    //   - Value = defined by User

// Working Directory:
    // * Place where you run Terrafrom commands 
    // * Place where you have Configurations Files 
    // * Root Module

// Terraform has Backend(terraform.tfstate)
    //  -Local Backend - gets generated in the same working directory
    //  -Remote Backend - gets generated in the remote system such S3 bucket

// What is the Backend?
    // -Stored 
    // -Stores your desired state of you Infrastruction 