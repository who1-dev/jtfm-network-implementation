env       = "dev"
region    = "us-east-1"
namespace = "RND"
default_tags = {
  Project    = "John-Modules"
  AppPurpose = "Network"
  Owner      = "JOHN-RND"
}


azs = ["us-east-1a", "us-east-1b"]
public_subnets = {
  "us-east-1a" = ["10.0.1.0/24"]
}

security_groups = {
  "Bastion-SG" = {
    name        = "Bastion-SG"
    description = "Security Group for Bastion Host"
    rules = [
      { port = 22, cidr_block = "0.0.0.0/0" },
    ]
  }
}