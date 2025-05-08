resource "snowflake_role" "custom" {
  for_each = toset(var.custom_roles)

  name = each.key
  comment = "Custom role for ${each.key}"
}
