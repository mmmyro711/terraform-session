resource "aws_default_vpc" "main" {
  tags = merge(
    { Name = replace(local.name, "rtype", "vpc") }, // !!!Repeat again !!!(*replace, *merge)
    local.common_tags
  )

}
resource "aws_default_subnet" "public_subnet_1" {
  availability_zone = "us-east-1a"
  tags = merge(
    { Name = replace(local.name, "rtype", "public_subnet_1") },
    local.common_tags
  )
}
resource "aws_default_subnet" "public_subnet_2" {
  availability_zone = "us-east-1b"
  tags = merge(
    { Name = replace(local.name, "rtype", "public_subnet_2") },
    local.common_tags
  )
}