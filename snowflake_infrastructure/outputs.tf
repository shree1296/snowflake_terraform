output "user_name" {
  value = module.users_roles.user_name
}

output "warehouse_name" {
  value = module.warehouses.warehouse_name
}

output "database_name" {
  value = module.databases_schemas.database_name
}
