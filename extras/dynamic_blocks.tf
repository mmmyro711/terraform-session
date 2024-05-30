# resource "aws_security_group" "main" {
# name = "dynamic-blocks-sg"
#     ingress {
#         from_port = 80
#         to_port = 80
#         protocol = "tpc"
#     }
#     ingress {
#         from_port = 22
#         to_port = 22
#         protocol = "tpc"
#     }
#     ingress {
#         from_port = 3306
#         to_port = 3306
#         protocol = "tpc"
#     }        
#     egress {
#         from_port = 0
#         to_port = 0
#         protocol = "-1"
#     } 
  
# }

# variable "ports" {
#   type = map()
#   description = "a map of names"
#   default = {
#     from_port = 80
#     to_port = 80
#     protocol= "tpc"
#   }
# }
//================================================================================//
 resource "aws_security_group" "main" {
    name = "dynamic-blocks-sg"

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

dynamic "ingress" {
    for_each = var.ports
    iterator = ports
    content {
        from_port = ports.value.port
        to_port = ports.value.port
        protocol = ports.value.protocol
        cidr_blocks = ["0.0.0.0/0"]
    }
   }
 }
 variable "ports" {
    type = list(object(
        {
        port = number
        protocol = string
    }
    ))
    default = [ 
        {
      port = 80
      protocol = "tpc"
    },
     {port = 22
      protocol = "tpc"
      },
      {
        port = 3306
        protocol = "tpc"
      }

    ]
   
 }