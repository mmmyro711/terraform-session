resource "aws_instance" "web" {
  count = 3
  ami           = "ami-0bb84b8ffd87024d8" // Data type is String, Hard Coded ""
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.web.id] // Dynamic (Dont used "")

  tags = {
    Name = "${var.env}-instance",   //dev-instance = # var.env-instance #
    Environment = var.env
  }
}
//
// * count = meaning create 3 instance with same ami and instance_type
// * index = 0, 1, 2, 3, 4
// * indices = plural of index 

########################################

//How to Reference to Input Vriable?
//    *Syntax var.variable_name" 

#########################################
// How to Reference to Resource?
//    *In order to Reference to Resource, we use lable (first and second)

##########################################
// Syntax: first_label.second_label.attributte
// Attributes has 4 group (id, arn,owner_id, tag_id)
##########################
// Highlight + Command + d
##########################
// how to combine half dynamic and half hard come in terraform?
// reference - "${var.env}-instance"   --- it is very important command 