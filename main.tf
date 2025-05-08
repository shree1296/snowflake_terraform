
provider "snowflake" {
  account  = var.snowflake_account
  username = var.snowflake_user
  password = var.snowflake_password
  region   = var.snowflake_region
  role     = "SECURITYADMIN"
}
