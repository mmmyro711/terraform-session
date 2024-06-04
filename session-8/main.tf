resource "aws_security_group" "main" {
  name        = "main"
  description = "Allow SSH and HTTP "

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" // all ports, protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "main" {
  key_name   = "imaclocalKey"
  public_key = file("~/.ssh/id_rsa.pub")
}
resource "aws_instance" "web" {
  depends_on             = [null_resource.main] // Exlicit Dependency
  ami                    = "ami-0bb84b8ffd87024d8"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.main.id] // Implicit Dependency 
  key_name               = aws_key_pair.main.id         // Implicit Dependency

  provisioner "file" {
    source      = "/Users/myroslav/Desktop/terraform-session/session-8/index.html" // The path where your file exist, local machine
    destination = "/tmp/index.html"                                                // The path where you wanna send your file to, remote machine

  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    host        = self.public_ip // Public IP of the EC2 Instance    // self = aws_instance.web
    private_key = file("~/.ssh/id_rsa")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install httpd -y",
      "sudo systemctl enable httpd",
      "sudo systemctl start httpd",
      "sudo cp /tmp/index.html /var/www/html/index.html"
    ]
    connection {
      type        = "ssh"
      user        = "ec2-user"            // Username
      host        = self.public_ip        // Public IP of the EC2 Instance    // self = aws_instance.web
      private_key = file("~/.ssh/id_rsa") // Private key of your local machine
    }
  }
}
resource "null_resource" "main" {
  provisioner "local-exec" {
    command = "echo 'Testing local exec, file, remote-exec previsioners' > index.html"
  }

}