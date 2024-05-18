variable "env" {
    type = string   // Data Type
    description = "this variable is for environment"  //Description
    default = "dev"  // Default Value
}

variable "ports" {
    type = list(number)
    description = "a list of port numbers "
    default = [ 22, 3306, 443, 80, 23 ]
}
