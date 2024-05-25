resource "aws_sqs_queue" "main" {
  name = "${var.env}-sqs"
}