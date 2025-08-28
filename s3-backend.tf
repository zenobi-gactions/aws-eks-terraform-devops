# terraform {
#   backend "s3" {
#     bucket = "my-terraform-state85"
#     key    = "environments2"
#     region = "us-east-1"
#     #    dynamodb_table = "my-terraform-eks-state-lock"
#     encrypt = true
#   }
# }

resource "aws_s3_bucket" "eks-bucket" {
  bucket = "dml-terraform-state"

  lifecycle  {
    prevent_destroy = false
  }
}

resource "aws_dynamodb_table" "my-dynamodb-table" {
  name           = "dml-terraform-eks-state-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }

}