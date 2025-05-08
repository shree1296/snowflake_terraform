
variable "snowflake_account" {}
variable "snowflake_user" {}
variable "snowflake_password" {}
variable "snowflake_region" {}

# Custom roles
variable "custom_roles" {
  type    = list(string)
  default = ["DEV_ADMIN", "QA_ANALYST", "PROD_SUPPORT"]
}

# Azure AD mapped group names (as roles in Snowflake)
variable "aad_roles" {
  type = map(string)
  default = {
    DEV_ANALYST   = "AAD_DEV_ANALYST"
    QA_ENGINEER   = "AAD_QA_ENGINEER"
    PROD_SUPPORT  = "AAD_PROD_SUPPORT"
  }
}
