variable "snowflake_account" {
  type        = string
  description = "Snowflake account identifier"
}

variable "snowflake_user" {
  type        = string
  description = "Snowflake user"
}

variable "snowflake_password" {
  type        = string
  description = "Snowflake user password"
  sensitive   = true
}

variable "snowflake_role" {
  type        = string
  description = "Snowflake role for provisioning"
}

variable "snowflake_warehouse" {
  type        = string
  description = "Default warehouse to use"
}

variable "snowflake_user_password" {
  type        = string
  description = "Password for the created Snowflake user"
  sensitive   = true
}

variable "environment" {
  type        = string
  description = "Deployment environment: dev, test, prod"
}
