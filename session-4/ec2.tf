resource "aws_instance" "web" {
  ami           = data.aws_ami.amazon_linux_2023.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.web.id] // Dynamic (Dont used "")
  user_data = data.template_file.userdata.rendered      // Get an output of the file 

  tags = {
    Name = "${var.env}-instance",   //dev-instance = # var.env-instance #
    Name1 = format("%s-instance", var.env)
    Environment = var.env
  }
}
// Referance to *Data Sources:
//  *Syntax: data.first_label.second_label.attribute
//  *Example: *data.aws_ami.amazon_linux_2023.image_id

// Reference to Resource:
//  *Syntax: first_label.secon_label.attribute
//  *Example: aws_ami.amazon_linux_2023.image_id
