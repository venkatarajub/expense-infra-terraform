output "default_vpc_info" {
  value       = module.vpc
  
}

output "default_route_table_info" {
    value = module.vpc
}

output "vpc_id" {
    value = module.vpc.vpc_id
}

