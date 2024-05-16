resource "aws_instance" "web" {
  ami           = "ami-0bb84b8ffd87024d8"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-session-instance-new"
  }
}