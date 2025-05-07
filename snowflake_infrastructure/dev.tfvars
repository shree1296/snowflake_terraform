roles = {
  dev_admin = {
    comment = "Development Admin role with elevated privileges"
  }
  dev_user = {
    comment = "Development User role with limited privileges"
  }
}

users = {
  "john_doe" = {
    login_name        = "john.doe"
    display_name      = "John Doe"
    email             = "john.doe@example.com"
    first_name        = "John"
    last_name         = "Doe"
    default_role      = "dev_admin"
    default_warehouse = "DEV_WH"
    comment           = "Senior developer with admin access"
  }

  "jane_user" = {
    login_name        = "jane.user"
    display_name      = "Jane User"
    email             = "jane.user@example.com"
    first_name        = "Jane"
    last_name         = "User"
    default_role      = "dev_user"
    default_warehouse = "DEV_WH"
    comment           = "Developer with user privileges"
  }
}

role_hierarchy = {
  dev_admin = {
    inherits_from = ["SYSADMIN"]
  }
  dev_user = {
    inherits_from = ["dev_admin"]
  }
}
