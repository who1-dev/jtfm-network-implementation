terraform {
  backend "s3" {
    #bucket = "tf-backend-s3-john-02sgh53"
    bucket = "terraform-module-state-bucket-2s6g4hg"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}