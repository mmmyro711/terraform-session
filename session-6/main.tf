module "ec2" {
    source = "github.com/mmmyro711/terraform-session//modules/ec2?ref=v1.0.0"   // we added     *?ref=v1.0.0
    //source = "https://github.com/mmmyro711/terraform-session/tree/main/modules/ec2" - remove /tree/main
    env = "dev"
    ami = "ami-0bb84b8ffd87024d8"
    instance_type = "t2.micro"
    sg = [module.sg.security_group_id]
}

module "sg" {
  source = "github.com/mmmyro711/terraform-session//modules/sg?ref=v1.0.1"
  //source = "https://github.com/mmmyro711/terraform-session/tree/main/modules/sg" -  remove /tree/main

  env = "dev"
  ports = [ "22", "80", "433" ]
}

# github.com = Domain name (scm)
# mmmyro711 = github organization(user)
# /terraform-session = repository
# /tree = ???
# /main = branch name
# /modules = directory
# /ec2 or sg = subdirectory