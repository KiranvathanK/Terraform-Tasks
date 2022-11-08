resource "aws_s3_bucket" "bucket"{
    bucket = "statefilecontains"
    force_destroy = true
}