variable "public_cidr_block" {
    type = list(string) #Data Type
    description = "this is the CIDR blocks of the public subnets" #description of your variable
    default = [ "10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24" ]  
}

variable "private_cidr_block" {
    type = list(string) 
    description = "private cidr block" 
    default = [ "10.0.11.0/24", "10.0.12.0/24", "10.0.13.0/24" ]

}

variable "availability_zone" {
    type = list(string)
    description = "Availability zones for the subnets"
    default = [ "us-east-1a", "us-east-1b", "us-east-1c" ] 
}