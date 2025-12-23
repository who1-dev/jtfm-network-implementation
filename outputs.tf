output "vpc" {
  value = module.network.vpc
}
output "igw_id" {
  value = module.network.igw_id
}
output "nat_gateways" {
  value = module.network.nat_gateways
}
output "security_groups" {
  value = module.network.security_groups
}
output "active_azs" {
  value = module.network.active_azs
}
output "subnets" {
  value = module.network.subnets
}

output "nacls" {
  value = module.network.nacls
}