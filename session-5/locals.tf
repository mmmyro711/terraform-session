//      Naming Convention: Naming Standard 

# // 1. Provider name: aws, azure, google
# // 2. Region: use1, usw2, use2
# // 3. Environment: dev, qa, stage, prod
# // 4. Project name: batman, tom, jerry
# // 5. Application Tier: frontend, backend, db
# // 6. Resource Type: ec2, s3, alb, asg, sg, rds

# // RDS Instance name looks like:
# // aws-usw2-dev-tom-db-rds

# // S3 Bucket :
# // aws-usw2-dev-tom-backend-s3

# // EC2:
# // aws-usw2-dev-tom-frontend-ec2


//      Tagging Standard: Common Tags

# // 1. Environment: dev, qa, stage, prod
# // 2. Project name: batman, tom, jerry, messi
# // 3. Application tier: frontend, backend, db
# // 4. Team: Cloud, DevOps, Development
# // 5. Owner: myroslav (myro@gmail.com)
# // 6. Manage_By : cloudformation, terraform, python, manual
# // 7. Lead : guliza

locals {
  name = "aws-${var.region}-${var.env}-${var.project}-${var.tier}-rtype" //rtype - replace type         // data type - string

  common_tags = {
    Environment = var.env
    Project     = var.project
    Tier        = var.tier
    Team        = var.team
    Owner       = var.owner
    Manage_By   = var.managed_by
    tier        = var.tier
  }
}