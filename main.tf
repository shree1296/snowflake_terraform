terraform {
  required_providers {
    snowflake = {
      source = "snowflake-connector/snowflake"
      version = "~> 2.0"  # Adjust version if necessary
    }
  }
}

provider "snowflake" {
  account  = var.SNOWFLAKE_ACCOUNT
  username = var.SNOWFLAKE_USER
  password = var.SNOWFLAKE_PASSWORD
  region   = var.SNOWFLAKE_REGION
}
