terraform {
  backend "s3" {
    bucket = "preprodstatebucket"
    key    = "preprod/terraform.tfstate"
    dynamodb_table = "preprodstatedynamodbtable"
  }
}