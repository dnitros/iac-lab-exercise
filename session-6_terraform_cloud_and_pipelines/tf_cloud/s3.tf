resource "aws_s3_bucket" "state_bucket" {
  bucket        = "${var.prefix}-tf-cloud"
  force_destroy = true

  tags = {
    Name = "${var.prefix}-tf-cloud"
  }
}