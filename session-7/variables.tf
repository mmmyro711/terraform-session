/////// Metadata
variable "env" {
  type        = string
  description = "Environment"
  default     = "dev"
}
variable "team" {
  type        = string
  description = "Team"
  default     = "devops"
}
variable "project" {
  type        = string
  description = "Project"
  default     = "nemo"
}
variable "app" {
  type        = string
  description = "Application"
  default     = "dori"
}
///////////Security Group ///////
variable "ec2_ports" {
  type = list(object(
    {
      port     = number
      protocol = string
    }
  ))
  default = [
    {
      port     = 80
      protocol = "tcp"
    },
    { port     = 22
      protocol = "tcp"
    },

  ]

}
variable "alb" {
  type = list(object(
    {
      port     = number
      protocol = string
    }
  ))
  default = [
    {
      port     = 80
      protocol = "tcp"
    },
    { port     = 443
      protocol = "tcp"
    },

  ]

}
///////////////Launch Teampate //////////////
variable "instance_type" {
  type = string
  description = "this is instance type"
  default ="t2.micro"  
}
variable "zone_id" {
  type = string
  description = "zona id"
  default = "Z02335883HZQOSPAXBIE9"
  
}