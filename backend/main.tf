provider "aws" {
  region = "us-east-1"

}

resource "aws_s3_bucket" "example" {
  bucket = "forstate"

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "forstate-db" {
  name         = "forstate-db"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
