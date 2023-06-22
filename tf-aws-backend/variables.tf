variable "bucket_name" {
    default = "backend-terraform-platzi-gzl"
}

variable "acl" {
    default = "private"
}

variable "tags" {
    default = {
        Environment = "dev"
        CreatedBy = "Terraform gzl"
    }
}