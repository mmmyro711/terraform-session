variable "env" {
  type = string 
  description = "this is for environment"
  default = "dev"
}
variable "ami" {
  type = string
  description = "amazon machine image"
  default = "ami-0bb84b8ffd87024d8"
}
variable "instance_type" {
  type = string
  description = "instance size"
  default = "t2.micro"
}

variable "sg" {
  type = list(string)
  description = "sucurity group id"
  default = [ "" ]
  
}