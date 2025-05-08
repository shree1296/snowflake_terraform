
resource "snowflake_user" "dev_user" {
  name     = "dev_user"
  login_name = "dev_user_login"
  default_warehouse = "DEV_WAREHOUSE"
  default_role      = "DEV_ROLE"
  default_namespace = "DEV_DATABASE.SCHEMA"

  # Since you're using Azure SSO, no password is needed
  authentication = "EXTERNALBROWSER"
  comment = "Dev user for dev environment"
}
