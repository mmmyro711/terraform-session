// We create Naming Conventian and Tagging Standarts
// !!! We can not have variable inside the variable !!!

variable "region" {
  type        = string
  description = "aws region"
  default     = "use1"

}
variable "env" {
  type        = string
  description = "environment"
  default     = "dev"

}
variable "project" {
  type        = string
  description = "project name"
  default     = "jerry"

}
variable "tier" {
  type        = string
  description = "application tier"
  default     = "backend"

}
variable "team" {
  type        = string
  description = "team name"
  default     = "cloud"

}
variable "owner" {
  type        = string
  description = "owner of the resource"
  default     = "myro"

}
variable "managed_by" {
  type        = string
  description = "managed by"
  default     = "terraform"

}
