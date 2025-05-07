# Create all custom roles
resource "snowflake_role" "custom_roles" {
  for_each = var.roles

  name    = each.key
  comment = each.value.comment
}

# Create Snowflake users
resource "snowflake_user" "users" {
  for_each = var.users

  name                  = each.key
  login_name            = each.value.login_name
  display_name          = each.value.display_name
  email                 = each.value.email
  first_name            = each.value.first_name
  last_name             = each.value.last_name
  default_role          = each.value.default_role
  default_warehouse     = each.value.default_warehouse
  disabled              = false
  must_change_password  = true
  comment               = each.value.comment
}

# Grant default role to users
resource "snowflake_role_grants" "user_role_grants" {
  for_each = var.users

  role_name = each.value.default_role
  users     = [each.key]
}

# Role inheritance for RBAC hierarchy
resource "snowflake_role_grants" "rbac_hierarchy" {
  for_each = var.role_hierarchy

  role_name = each.key                   # Child role
  roles     = each.value.inherits_from  # List of parent roles
}
