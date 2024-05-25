module "ec2" {
    /////////// Module argument ///////
    source = "../../modules/ec2"           // Required argument, where your specify the location of Child Module
    // version = ""

////////// Input Vriables thet are required for the Child Module ///////////////
    env = "dev"
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    sg = [module.sg.security_group_id]
}

module "sg" {
  source = "../../modules/sg"

  env = "dev"
  ports = [ "22", "80", "433" ]
}

// How to Reference to Module?
// Syntax: *module.module_name.output_name*