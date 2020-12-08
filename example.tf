terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 2.70"
    }
  }
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_sqs_queue" "terraform_queue" {
  name                        = "terraform-example-queue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_s3_bucket" "b" {
  bucket = "ertw-terraform-serverless-example"
  acl    = "private"

  tags = {
    Name        = "serverless example bucket"
    Environment = "Dev"
  }
}

#resource "aws_lambda_function" "example" {
#   function_name = "ServerlessExample"
#
#   # The bucket name as created earlier with "aws s3api create-bucket"
#   s3_bucket = "terraform-serverless-example"
#   s3_key    = "v1.0.0/example.zip"
#
#   # "main" is the filename within the zip file (main.js) and "handler"
#   # is the name of the property under which the handler function was
#   # exported in that file.
#   handler = "main.handler"
#   runtime = "nodejs10.x"
#
#   role = aws_iam_role.lambda_exec.arn
#}
#
# # IAM role which dictates what other AWS services the Lambda function
# # may access.
#resource "aws_iam_role" "lambda_exec" {
#   name = "serverless_example_lambda"
#
#   assume_role_policy = <<EOF
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Action": "sts:AssumeRole",
#      "Principal": {
#        "Service": "lambda.amazonaws.com"
#      },
#      "Effect": "Allow",
#      "Sid": ""
#    }
#  ]
#}
#EOF
#
#}