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
  "us-east-1b" = ["10.0.2.0/24"]
}

private_subnets = {
  "us-east-1a" = ["10.0.10.0/24"]
  "us-east-1b" = ["10.0.20.0/24"]
}

database_subnets = {
  "us-east-1a" = []
  "us-east-1b" = []
}


enable_nat_gateway             = true
deploy_nat_in_all_public_azs   = true
set_nat_deployment_az_location = ["us-east-1b"]

interface_endpoints = {
  "SSM" = {
    subnet_keys         = ["1A1"]
    security_group_keys = ["SSM-SG"]
  }
}

security_groups = {
  "SSM-SG" = {
    name        = "ssm-endpoint-sg"
    description = "Security Group for SSM VPC Endpoint"
    rules = [
      { port = 443, cidr_block = "0.0.0.0/0" }
    ]
  }
  "Alpha-SG" = {
    name        = "Alpha-SG"
    description = "Security Group for Alpha Server"
    rules = [
      { port = 443, referenced_security_group_key = "SSM-SG" }
    ]
  },
  "Bastion-SG" = {
    name        = "Bastion-SG"
    description = "Security Group for Bastion Host"
    rules = [
      { port = 22, cidr_block = "0.0.0.0/0" },
    ]
  }
  "Beta-SG" = {
    name        = "Beta-SG"
    description = "Security Group for Beta Server"
    rules = [
      { port = 22, referenced_security_group_key = "Bastion-SG" }
    ]
  }
}


nacls_shared = {
  "SHARED_PUBLIC" = {
    name         = "SHARED_PUBLIC-NACL"
    common_rules = ["HTTP", "HTTPS"]
  }
}

nacls_public = {
  "1B1" = {
    is_bidirectional = true
    common_rules     = []
    inbound_rules = [
      {
        rule_number = 100
        protocol    = "tcp"
        rule_action = "allow"
        cidr_block  = "0.0.0.0/0"
        from_port   = 22
        to_port     = 22
      }
    ]
  }
}

nacls_private = {
  "1A1" = {
    is_bidirectional = true
    common_rules     = ["HTTPS"]
  }
}