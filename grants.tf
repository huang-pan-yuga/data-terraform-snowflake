# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/role_grants
resource "snowflake_role_grants" "terraform_role_grant" {
  role_name                 = snowflake_role.terraform.name
  enable_multiple_grants    = false
  roles                     = ["SYSADMIN"]
  users                     = [snowflake_user.terraform.name]
}

resource "snowflake_role_grants" "accelbyte_role_grant" {
  role_name                 = snowflake_role.accelbyte.name
  enable_multiple_grants    = false
  roles                     = ["SYSADMIN"]
  users                     = [snowflake_user.accelbyte.name]
}

resource "snowflake_role_grants" "aws_role_grant" {
  role_name                 = snowflake_role.aws.name
  enable_multiple_grants    = false
  roles                     = ["SYSADMIN"]
  users                     = [snowflake_user.aws.name]
}

resource "snowflake_role_grants" "y42_role_grant" {
  role_name                 = snowflake_role.y42.name
  enable_multiple_grants    = false
  roles                     = ["SYSADMIN"]
  users                     = [snowflake_user.y42.name]
}

resource "snowflake_role_grants" "sigma_role_grant" {
  role_name                 = snowflake_role.sigma.name
  enable_multiple_grants    = false
  roles                     = ["SYSADMIN"]
  users                     = [snowflake_user.sigma.name]
}

resource "snowflake_role_grants" "hex_role_grant" {
  role_name                 = snowflake_role.hex.name
  enable_multiple_grants    = false
  roles                     = ["SYSADMIN"]
  users                     = [snowflake_user.hex.name]
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/database_grant

#snowflake_grant_privileges_to_account_role
#resource "snowflake_grant_privileges_to_role" "database_grant" {
#  provider   = snowflake.security_admin
#  privileges = ["USAGE"]
#  role_name  = snowflake_role.role.name
#  on_account_object {
#    object_type = "DATABASE"
#    object_name = snowflake_database.db.name
#  }
#}



resource "snowflake_database_grant" "test_database_grant" {
  database_name             = snowflake_database.test.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.terraform.name,
                               snowflake_role.accelbyte.name,
                               snowflake_role.aws.name,
                               snowflake_role.y42.name,
                               snowflake_role.sigma.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_database_grant" "telemetry_database_grant" {
  database_name             = snowflake_database.telemetry.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.terraform.name,
                               snowflake_role.accelbyte.name,
                               snowflake_role.aws.name,
                               snowflake_role.y42.name,
                               snowflake_role.sigma.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_database_grant" "datascience_database_grant" {
  database_name             = snowflake_database.datascience.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.terraform.name,
                               snowflake_role.y42.name,
                               snowflake_role.sigma.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/schema_grant
resource "snowflake_schema_grant" "test_schema_future_grant" {
  database_name             = snowflake_database.test.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.accelbyte.name,
                               snowflake_role.aws.name,
                               snowflake_role.y42.name,
                               snowflake_role.sigma.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_schema_grant" "telemetry_schema_future_grant" {
  database_name             = snowflake_database.telemetry.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_schema_grant" "datascience_schema_future_grant" {
  database_name             = snowflake_database.datascience.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_schema_grant" "telemetry_schema_bronze_accelbyte_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_bronze_accelbyte.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.accelbyte.name]
  with_grant_option         = false
}

resource "snowflake_schema_grant" "telemetry_schema_bronze_helika_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_bronze_helika.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.aws.name]
  with_grant_option         = false
}

resource "snowflake_schema_grant" "telemetry_schema_bronze_web_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_bronze_web.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.aws.name]
  with_grant_option         = false
}

resource "snowflake_schema_grant" "datascience_schema_bronze_sigma_grant" {
  database_name             = snowflake_database.datascience.name
  schema_name               = snowflake_schema.datascience_bronze_sigma.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name,
                               snowflake_role.sigma.name]
  with_grant_option         = false
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/table_grant
resource "snowflake_table_grant" "telemetry_bronze_accelbyte_table_future_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_bronze_accelbyte.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.accelbyte.name]
  with_grant_option         = false
}

resource "snowflake_table_grant" "telemetry_bronze_helika_table_future_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_bronze_helika.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.aws.name]
  with_grant_option         = false
}

resource "snowflake_table_grant" "telemetry_bronze_web_table_future_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_bronze_web.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.aws.name]
  with_grant_option         = false
}

resource "snowflake_table_grant" "telemetry_sandbox_table_future_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_sandbox.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_table_grant" "telemetry_archive_table_future_grant" {
  database_name             = snowflake_database.telemetry.name
  schema_name               = snowflake_schema.telemetry_archive.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_table_grant" "datascience_sandbox_table_future_grant" {
  database_name             = snowflake_database.datascience.name
  schema_name               = snowflake_schema.datascience_sandbox.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_table_grant" "datascience_archive_table_future_grant" {
  database_name             = snowflake_database.datascience.name
  schema_name               = snowflake_schema.datascience_archive.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

resource "snowflake_table_grant" "datascience_bronze_sigma_table_future_grant" {
  database_name             = snowflake_database.datascience.name
  schema_name               = snowflake_schema.datascience_bronze_sigma.name
  enable_multiple_grants    = false
  on_future                 = true
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.y42.name,
                               snowflake_role.hex.name,
                               snowflake_role.sigma.name]
  with_grant_option         = false
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/warehouse_grant
/*resource "snowflake_warehouse_grant" "compute_grant" {
  warehouse_name            = snowflake_warehouse.compute.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.terraform.name]
  with_grant_option         = false
}*/

resource "snowflake_warehouse_grant" "etl_grant" {
  warehouse_name            = snowflake_warehouse.etl.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.accelbyte.name,
                               snowflake_role.aws.name,
                               snowflake_role.y42.name]
  with_grant_option         = false
}

resource "snowflake_warehouse_grant" "datascience_grant" {
  warehouse_name            = snowflake_warehouse.datascience.name
  enable_multiple_grants    = false
  privilege                 = "ALL PRIVILEGES"
  roles                     = [snowflake_role.sigma.name,
                               snowflake_role.hex.name]
  with_grant_option         = false
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/grant_privileges_to_role
