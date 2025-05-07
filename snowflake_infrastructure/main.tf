# Terraform configuration for Snowflake infrastructure management
# This is the root module that calls individual modules to provision users, roles,
# warehouses, databases, schemas, resource monitors, storage integrations, and network policies.

terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.97.0"
    }
  }
}

# Configure the Snowflake provider with credentials and environment info from variables
provider "snowflake" {
  account   = var.snowflake_account
  user      = var.snowflake_user
  password  = var.snowflake_password
  role      = var.snowflake_role
  warehouse = var.snowflake_warehouse
}

# Call users and roles module
module "users_roles" {
  source = "./modules/users_roles"
  environment = var.environment
  snowflake_user_password = var.snowflake_user_password
}

# Call warehouses module
module "warehouses" {
  source = "./modules/warehouses"
  environment = var.environment
}

# Call databases and schemas module
module "databases_schemas" {
  source = "./modules/databases_schemas"
  environment = var.environment
}

# Call resource monitors module
module "resource_monitors" {
  source = "./modules/resource_monitors"
  environment = var.environment
}

# Call storage integrations module
module "storage_integrations" {
  source = "./modules/storage_integrations"
  environment = var.environment
}
# Call network policies module
module "network_policies" {
  source = "./modules/network_policies"
  environment = var.environment
}
