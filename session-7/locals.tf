locals {
  name = "aws-${var.team}-${var.project}-${var.app}-rtype-${var.env}"
  common_tags = {
    Environment = var.env
    Team        = var.team
    Application = var.app
    Project     = var.project
    Owner       = "myro"
    Managed_By  = "terraform"
  }
  asg_tags = merge(
    { Name = replace(local.name, "rtype", "asg") },
    local.common_tags
  )
}
# Name: aws-team-project-app-environment
# Tags: