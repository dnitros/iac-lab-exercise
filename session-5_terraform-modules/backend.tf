terraform {
  backend "s3" {
    bucket = "dnitros-iac-lab-tfstate"
    key    = "ap-south-1/iac-demo/terraform.tfstate"
    region = "ap-south-1"

    dynamodb_table = "dnitros-iac-lab-tfstate-locks"
    encrypt        = true
  }
}