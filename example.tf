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
  bucket = "terreform-serverless-example"
  acl    = "private"

  tags = {
    Name        = "serverless example bucket"
    Environment = "Dev"
  }
}