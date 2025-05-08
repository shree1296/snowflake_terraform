# Assign Azure AD groups to Snowflake roles
resource "snowflake_role_grants" "aad_role_grants" {
  for_each = var.aad_roles

  role_name = each.key
  roles     = [each.value]  # Assuming AAD group is already mapped as a Snowflake role
}
