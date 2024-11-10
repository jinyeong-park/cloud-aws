terraform {

}

# Actively managed by us, by our Terraform project
resource "aws_s3_bucket" "my_bucket" {
    # bucket = "my-sample-bucket"
    bucket = var.bucket_name

}

# managed somewhere else, we just want to use in our project
data "aws_s3_bucket" "my_external_bucket" {
    bucket = "not_managed_by_us"
}

variable "bucket_name" {
    type = string
    description = "My variable used to set bucket name"
    default = "my_default_bucket_name"
}

output "bucket_id" {
    # value = aws_s3_bucket.my_bucket.id
    value = local.local_example
}

# temporary variables within body of the function
locals {
    local_example = "This is a local variable"


}

module "my_module" {
    source = "./module-example"
}