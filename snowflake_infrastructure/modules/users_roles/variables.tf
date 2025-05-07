###########################################
# Define Custom Roles (e.g., dev_admin, dev_user)
###########################################
variable "roles" {
  description = "Map of custom roles with descriptions"
  type = map(object({
    comment = string                       # Description of the role
  }))
}

###########################################
# Define Users to Be Created
###########################################
variable "users" {
  description = "Map of users to be created with default roles"
  type = map(object({
    login_name        = string             # Login name for authentication
    display_name      = string             # Friendly display name
    email             = string             # Email ID
    first_name        = string
    last_name         = string
    default_role      = string             # Role assigned on login
    default_warehouse = string             # Default WH for user sessions
    comment           = string             # Any comment or note
  }))
}

###########################################
# Define RBAC Role Hierarchy
###########################################
variable "role_hierarchy" {
  description = "Map defining child roles and their parent roles"
  type = map(object({
    inherits_from = list(string)          # Parent role(s) to inherit from
  }))
  default = {}                             # Default is empty (no hierarchy)
}
