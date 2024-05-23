// exaple name: aws_use1-dev-tom-db-rds

# resource "aws_sqs_queue" "main" {   
#   name= "aws-${var.region}-${var.env}-${var.project}-${var.tier}-sqs"
#   tags = {
#     //Key=Value
#     Environment = var.env   //
#     Project = var.project   //
#     Tier = var.tier         //      All this is ** requirements
#     Team = var.team         //
#     Owner = var.owner       //
#     Manage_By = var.managed_by  //
#   }
# }

# // 1. Environment: dev, qa, stage, prod
# // 2. Project name: batman, tom, jerry, messi
# // 3. Application tier: frontend, backend, db
# // 4. Team: Cloud, DevOps, Development
# // 5. Owner: myroslav (myro@gmail.com)
# // 6. Manage_By = cloudformation, terraform, python, manual

resource "aws_sqs_queue" "main" {
  name = replace(local.name, "rtype", "sqs") //"aws-${var.region}-${var.env}-${var.project}-${var.tier}-sqs"
  tags = local.common_tags

}

// Reference to Local Value?
//  Syntax: local.local_name
//  Example: local.name, local.common_tags

//--------------------------------------------------------------------------------------------------------

resource "aws_db_instance" "main" {
  allocated_storage    = 10
  identifier = replace(local.name, "rtype", "rds" )
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = random_password.db_password.result
  parameter_group_name = "default.mysql8.0"
  tags = local.common_tags
  skip_final_snapshot  = var.env != "prod" ? true : false
  final_snapshot_identifier = var.env != "prod" ? null : "${var.env}-final-shapshot"

}

//skip_final_snapshot  = true (I do not need snapshot)
//skip_final_snapshot  = false(I need snapshot), if is #false# I need this argument *final_snapshot_identifier*

// true = dev, qa, stage
// false = prod (prodactional )

// *null is ignore argument 

resource "random_password" "db_password" {
  length           = 16
  special          = true
  override_special = "%"
}