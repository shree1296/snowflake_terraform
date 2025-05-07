###########################################
# Create Custom Roles in Snowflake
###########################################
resource "snowflake_role" "custom_roles" {
  for_each = var.roles

  name    = each.key                       # Role name (e.g., dev_admin)
  comment = each.value.comment             # Description for the role
}

###########################################
# Create Users in Snowflake
###########################################
resource "snowflake_user" "users" {
  for_each = var.users

  name                  = each.key
  login_name            = each.value.login_name             # Unique login username
  display_name          = each.value.display_name           # Full name for UI
  email                 = each.value.email                  # User email address
  first_name            = each.value.first_name
  last_name             = each.value.last_name
  default_role          = each.value.default_role           # Role assigned at login
  default_warehouse     = each.value.default_warehouse      # Default WH for user
  disabled              = false                             # Ensure user is active
  must_change_password  = true                              # Force password reset at first login
  comment               = each.value.comment                # Notes about the user
}

###########################################
# Grant Default Role to Each User
###########################################
resource "snowflake_role_grants" "user_role_grants" {
  for_each = var.users

  role_name = each.value.default_role      # Assign default role
  users     = [each.key]                   # To the specific user
}

###########################################
# Define RBAC Hierarchy (Role Inheritance)
###########################################
resource "snowflake_role_grants" "rbac_hierarchy" {
  for_each = var.role_hierarchy

  role_name = each.key                     # Child role
  roles     = each.value.inherits_from     # Parent roles (can include SYSADMIN, SECURITYADMIN, etc.)
}
