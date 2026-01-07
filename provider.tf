terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  default_tags {
    tags = merge(var.default_tags, {
      namespace   = format("%s-%s", var.namespace, var.env)
      environment = var.env
    })
  }
}
