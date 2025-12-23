module "network" {
  source = "git::https://github.com/who1-dev/jtfm-network.git?ref=v1.0.0"
  env                            = var.env
  namespace                      = var.namespace
  default_tags                   = var.default_tags
  region                         = var.region
  cidr_block                     = var.cidr_block
  instance_tenancy               = var.instance_tenancy
  enable_dns_support             = var.enable_dns_support
  enable_dns_hostnames           = var.enable_dns_hostnames
  azs                            = var.azs
  enable_nat_gateway             = var.enable_nat_gateway
  deploy_nat_in_all_public_azs   = var.deploy_nat_in_all_public_azs
  set_nat_deployment_az_location = var.set_nat_deployment_az_location
  public_subnets                 = var.public_subnets
  private_subnets                = var.private_subnets
  database_subnets               = var.database_subnets

  #Security Group Variables
  security_groups = var.security_groups

  #VPC Endpoint Variables
  interface_endpoints = var.interface_endpoints

  #NACL Variables
  nacls_shared   = var.nacls_shared
  nacls_public   = var.nacls_public
  nacls_private  = var.nacls_private
  nacls_database = var.nacls_database

}