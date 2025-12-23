terraform {
  backend "s3" {
    bucket = "terraform-module-state-bucket-2s6g4h"
    key    = "network/terraform.tfstate"
    region = "us-east-1"
  }
}