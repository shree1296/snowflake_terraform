# users.tf - Creating Azure SSO users in Snowflake

# Define a list of employee names
variable "employee_names" {
  type    = list(string)
  default = [
    "employee1", "employee2", "employee3", "employee4", "employee5",
    "employee6", "employee7", "employee8", "employee9", "employee10",
    "employee11", "employee12", "employee13", "employee14", "employee15",
    "employee16", "employee17", "employee18", "employee19", "employee20",
    "employee21", "employee22", "employee23", "employee24", "employee25",
    "employee26", "employee27", "employee28", "employee29", "employee30",
    "employee31", "employee32", "employee33", "employee34", "employee35",
    "employee36", "employee37", "employee38", "employee39", "employee40",
    "employee41", "employee42", "employee43", "employee44", "employee45",
    "employee46", "employee47", "employee48", "employee49", "employee50"
  ]
}

# Loop to create users based on the list
resource "snowflake_user" "employees" {
  for_each = toset(var.employee_names)

  name            = each.value
  login_name      = each.value
  comment         = "SSO user for ${each.value}"
  authentication = "EXTERNALBROWSER"  # Azure SSO authentication
  default_role    = "EMPLOYEE_ROLE"    # Default role assigned to all users
  default_warehouse = "DEV_WAREHOUSE"
  default_namespace = "DEV_DATABASE.SCHEMA"
}

# Assign roles for each user (you can customize the role per user type)
resource "snowflake_role_grant" "employee_roles" {
  for_each = toset(var.employee_names)

  role_name = "EMPLOYEE_ROLE"
  user_name = snowflake_user.employees[each.value].name
}
