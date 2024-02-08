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

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/grant_privileges_to_account_role
# NOTE: above is a superset of https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/grant_privileges_to_role
# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/database_grant DEPRECATED
# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/schema_grant DEPRECATED
## TEST_DB
#  TERRAFORM
resource "snowflake_grant_privileges_to_account_role" "test_database_grant_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_all_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_schema {
    all_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_future_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_schema {
    future_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

#  ACCELBYTE
resource "snowflake_grant_privileges_to_account_role" "test_database_grant_accelbyte" {
  account_role_name = snowflake_role.accelbyte.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_all_accelbyte" {
  account_role_name = snowflake_role.accelbyte.name
  on_schema {
    all_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_future_accelbyte" {
  account_role_name = snowflake_role.accelbyte.name
  on_schema {
    future_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

#  AWS
resource "snowflake_grant_privileges_to_account_role" "test_database_grant_aws" {
  account_role_name = snowflake_role.aws.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_all_aws" {
  account_role_name = snowflake_role.aws.name
  on_schema {
    all_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_future_aws" {
  account_role_name = snowflake_role.aws.name
  on_schema {
    future_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

#  Y42
resource "snowflake_grant_privileges_to_account_role" "test_database_grant_y42" {
  account_role_name = snowflake_role.y42.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_all_y42" {
  account_role_name = snowflake_role.y42.name
  on_schema {
    all_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_future_y42" {
  account_role_name = snowflake_role.y42.name
  on_schema {
    future_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

#  SIGMA
resource "snowflake_grant_privileges_to_account_role" "test_database_grant_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_all_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_schema {
    all_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_future_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_schema {
    future_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

#  HEX
resource "snowflake_grant_privileges_to_account_role" "test_database_grant_hex" {
  account_role_name = snowflake_role.hex.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_all_hex" {
  account_role_name = snowflake_role.hex.name
  on_schema {
    all_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "test_schema_grant_future_hex" {
  account_role_name = snowflake_role.hex.name
  on_schema {
    future_schemas_in_database = snowflake_database.test.name
  }
  all_privileges    = true
}


## TELEMETRY_DB
#  TERRAFORM
resource "snowflake_grant_privileges_to_account_role" "telemetry_database_grant_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_all_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_schema {
    all_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_future_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_schema {
    future_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

#  ACCELBYTE
resource "snowflake_grant_privileges_to_account_role" "telemetry_database_grant_accelbyte" {
  account_role_name = snowflake_role.accelbyte.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

#  AWS
resource "snowflake_grant_privileges_to_account_role" "telemetry_database_grant_aws" {
  account_role_name = snowflake_role.aws.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

#  Y42
resource "snowflake_grant_privileges_to_account_role" "telemetry_database_grant_y42" {
  account_role_name = snowflake_role.y42.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_all_y42" {
  account_role_name = snowflake_role.y42.name
  on_schema {
    all_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_future_y42" {
  account_role_name = snowflake_role.y42.name
  on_schema {
    future_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

#  SIGMA
resource "snowflake_grant_privileges_to_account_role" "telemetry_database_grant_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_all_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_schema {
    all_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_future_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_schema {
    future_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

#  HEX
resource "snowflake_grant_privileges_to_account_role" "telemetry_database_grant_hex" {
  account_role_name = snowflake_role.hex.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_all_hex" {
  account_role_name = snowflake_role.hex.name
  on_schema {
    all_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "telemetry_schema_grant_future_hex" {
  account_role_name = snowflake_role.hex.name
  on_schema {
    future_schemas_in_database = snowflake_database.telemetry.name
  }
  all_privileges    = true
}


## DATASCIENCE_DB
#  TERRAFORM
resource "snowflake_grant_privileges_to_account_role" "datascience_database_grant_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_all_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_schema {
    all_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_future_terraform" {
  account_role_name = snowflake_role.terraform.name
  on_schema {
    future_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}

#  Y42
resource "snowflake_grant_privileges_to_account_role" "datascience_database_grant_y42" {
  account_role_name = snowflake_role.y42.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_all_y42" {
  account_role_name = snowflake_role.y42.name
  on_schema {
    all_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_future_y42" {
  account_role_name = snowflake_role.y42.name
  on_schema {
    future_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}

#  SIGMA
resource "snowflake_grant_privileges_to_account_role" "datascience_database_grant_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_all_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_schema {
    all_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_future_sigma" {
  account_role_name = snowflake_role.sigma.name
  on_schema {
    future_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}

#  HEX
resource "snowflake_grant_privileges_to_account_role" "datascience_database_grant_hex" {
  account_role_name = snowflake_role.hex.name
  on_account_object {
    object_type = "DATABASE"
    object_name = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_all_hex" {
  account_role_name = snowflake_role.hex.name
  on_schema {
    all_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}

resource "snowflake_grant_privileges_to_account_role" "datascience_schema_grant_future_hex" {
  account_role_name = snowflake_role.hex.name
  on_schema {
    future_schemas_in_database = snowflake_database.datascience.name
  }
  all_privileges    = true
}


# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/grant_privileges_to_account_role
# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/schema_grant DEPRECATED
#resource "snowflake_schema_grant" "test_schema_future_grant" {
#  database_name             = snowflake_database.test.name
#  enable_multiple_grants    = false
#  on_future                 = true
#  privilege                 = "ALL PRIVILEGES"
#  roles                     = [snowflake_role.accelbyte.name,
#                               snowflake_role.aws.name,
#                               snowflake_role.y42.name,
#                               snowflake_role.sigma.name,
#                               snowflake_role.hex.name]
#  with_grant_option         = false
#}

#resource "snowflake_schema_grant" "telemetry_schema_future_grant" {
#  database_name             = snowflake_database.telemetry.name
#  enable_multiple_grants    = false
#  on_future                 = true
#  privilege                 = "ALL PRIVILEGES"
#  roles                     = [snowflake_role.y42.name,
#                               snowflake_role.hex.name]
#  with_grant_option         = false
#}

#resource "snowflake_schema_grant" "datascience_schema_future_grant" {
#  database_name             = snowflake_database.datascience.name
#  enable_multiple_grants    = false
#  on_future                 = true
#  privilege                 = "ALL PRIVILEGES"
#  roles                     = [snowflake_role.y42.name,
#                               snowflake_role.hex.name]
#  with_grant_option         = false
#}

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
