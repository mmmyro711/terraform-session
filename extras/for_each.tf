resource "aws_sqs_queue" "for_each_queue" {
#   for_each = {
#     first = "first-for-each"
#     second = "second-for-each"
#     third = "third-for-each"
#   }
  for_each = var.for_each_names
  name = each.value
}

variable "for_each_names" {
  type = map
  description = "a map of names"
  default = {
    first = "first-for-each"
    second = "second-for-each"
    third = "third-for-each" 
  }
}
# resource "aws_instance" "multiple" {
#   count = 3
#   instance_type = element()
# }
# variable "instance_type" {
#     type = list(string)
#     description = "a list of asa names"
#     default = [ "t2.micro", "t2.midium", "t2.small" ]
  
# }
