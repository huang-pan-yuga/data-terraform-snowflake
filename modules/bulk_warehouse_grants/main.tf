terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = ">=0.84.1"    }
    random = {
      version = ">=2.2.0"
    }
  }
}

resource "snowflake_warehouse_grant" "main" {
  for_each = var.grants

  warehouse_name    = coalesce(each.value["warehouse_name"], each.key)
  privilege         = coalesce(each.value["privilege"], var.default_privilege)
  roles             = coalesce(each.value["roles"], var.default_roles)
  with_grant_option = coalesce(each.value["with_grant_option"], var.default_with_grant_option)
}
