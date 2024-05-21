data "aws_ami" "amazon_linux_2023" {
  most_recent      = true    // I will updating ami
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.*"]  //al2023 -Major,-ami -Minor-, .*" - Path
    // name is same in all regions
  }
  //    Semantic Versioning:
  //        *Major.Minor.Path

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}
//////////////////////////////////////
// Template Files

data "template_file" "userdata" {
    template = file("userdata.sh")
    vars = {
        environment = var.env //<--- Need do the reference from ec2
    }
}

//
//  Data Source Block : Featch the data from Pre-existing Resource
//      Syntax: *data"first_label" "second_label"
