provider "snowflake" {
  account  = var.snowflake_account
  region   = var.snowflake_region
  username = var.snowflake_username
  password = var.snowflake_user_password
  role     = var.snowflake_user_role
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/role
# https://docs.snowflake.com/en/sql-reference/sql/create-role for default values
resource "snowflake_role" "terraform" {
  name    = "TERRAFORM_ROLE"
  comment = "Role for Terraform integration"
}

resource "snowflake_role" "accelbyte" {
  name    = "ACCELBYTE_ROLE"
  comment = "Role for AccelByte integration"
}

resource "snowflake_role" "aws" {
  name    = "AWS_ROLE"
  comment = "Role for AWS integration"
}

resource "snowflake_role" "y42" {
  name    = "Y42_ROLE"
  comment = "Role for Y42 integration"
}

resource "snowflake_role" "sigma" {
  name    = "SIGMA_ROLE"
  comment = "Role for Sigma Computing integration"
}

resource "snowflake_role" "hex" {
  name    = "HEX_ROLE"
  comment = "Role for Hex integration"
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/user
# https://docs.snowflake.com/en/sql-reference/sql/create-user for default values
resource "snowflake_user" "terraform" {
  name                  = "TERRAFORM"
  comment               = "For Terraform integration"
  password              = "secret"
  email                 = "data.admin@yugalabs.io"
  default_warehouse     = "COMPUTE_WH"
  default_role          = "TERRAFORM_ROLE"
}

resource "snowflake_user" "accelbyte" {
  name                  = "ACCELBYTE"
  comment               = "For AccelByte integration"
  password              = "secret"
  email                 = "data.admin@yugalabs.io"
  default_warehouse     = "ETL_WH"
  default_role          = "ACCELBYTE_ROLE"
  default_namespace     = "TELEMETRY_DB.BRONZE_ACCELBYTE"
  # For AccelByte Snowflake Connector
  # https://docs.google.com/spreadsheets/d/1XZGH6kVMvaQmz-1XIZZHHXPMaVfmH8c0KyGYDk8uZXI/edit?usp=sharing
  rsa_public_key        = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA3lhqdqy7phd96KYZvn5f6d/Ry1du1buyhyM3yYjwE+tsm5hIXAqfm1sqjaU2jjQalEsxMTCJBB4SNG3Fxw9Q2bi9vd+2rGt3NQmMSP3pE7UncDo0lPZwmhRufhZ1dD4/nFM7xkFwm/hf2KBIA2XBjaF+gIS44QnLoUKscruYaZsk2f0QTVeEgoUcx2ddNOOJuXp1MmQovu3eBWpyFGpqi4pYRR4kfAdQroQByI+90PMFh2tFUpTqa6AKJFEViwR68sKJCfs5t3Mtwy25+VkSNmwEP574MJVQjlW0Uje7TL14XpdEvYEotH5wOA2MM7opEka480eknpmjkUSMt6M18QIDAQAB"
}

resource "snowflake_user" "aws" {
  name                  = "AWS"
  comment               = "For AWS integration"
  password              = "secret"
  email                 = "data.admin@yugalabs.io"
  default_warehouse     = "ETL_WH"
  default_role          = "AWS_ROLE"
  # For AWS Kinesis Data Firehose
  # https://docs.aws.amazon.com/firehose/latest/dev/create-destination.html#create-destination-snowflake
  rsa_public_key        = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA7pfN1F2A2aDYIetpJPi1eovBSXrJN0zJVc+aXd58NxYHTX83uOOrpOSKelm6fnbExtNPa/GzHwlpc9hFKB4/92w5SiUJ5jpUAWzs5wf1La0R8FLEaahcq8Q5QLDdwv5i99tP//+b3n4xUqc0Fe+4/1Nh3ohbMITBJEhYyRJbWPe8sqrDUMSYZTYyR1MUR/mJiGZ+hsj4w3L8jjvWW3G0CNDtyIa7dalZ4sl5dCt6v9GJfsmfiuL25UxLZqkjxpt38HTf9m/B2IbTccBhBOSbh0BYOZtgdR/JF37qykvl07hA7ssgR3iFctacsXjj1YPq0wS2QfHJT+Lmj8sfKC1H5QIDAQAB"
}

resource "snowflake_user" "y42" {
  name                  = "Y42"
  comment               = "For Y42 integration"
  password              = "secret"
  email                 = "data.admin@yugalabs.io"
  default_warehouse     = "ETL_WH"
  default_role          = "Y42_ROLE"
}

resource "snowflake_user" "sigma" {
  name                  = "SIGMA"
  comment               = "For Sigma Computing integration"
  password              = "secret"
  email                 = "data.admin@yugalabs.io"
  default_warehouse     = "DATASCIENCE_WH"
  default_role          = "SIGMA_ROLE"
}

resource "snowflake_user" "hex" {
  name                  = "HEX"
  comment               = "For Hex integration"
  password              = "secret"
  email                 = "data.admin@yugalabs.io"
  default_warehouse     = "DATASCIENCE_WH"
  default_role          = "HEX_ROLE"
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/database
# https://docs.snowflake.com/en/sql-reference/sql/create-database for default values
resource "snowflake_database" "test" {
  name      = "TEST_DB"
  comment   = "Yuga Sandbox DB"
}

resource "snowflake_database" "telemetry" {
  name      = "TELEMETRY_DB"
  comment   = "Yuga telemetry events stored here"
}

resource "snowflake_database" "datascience" {
  name      = "DATASCIENCE_DB"
  comment   = "For Yuga Data Science"
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/schema
# https://docs.snowflake.com/en/sql-reference/sql/create-schema for default values
# TEST_DB
resource "snowflake_schema" "test_bronze" {
  database  = "TEST_DB"
  name      = "BRONZE"
  comment   = "Raw data"
}

resource "snowflake_schema" "test_silver" {
  database  = "TEST_DB"
  name      = "SILVER"
  comment   = "Canonical / cleaned / tested / staged / intermediate data"
}

resource "snowflake_schema" "test_gold" {
  database  = "TEST_DB"
  name      = "GOLD"
  comment   = "Serving / mart / metrics data"
}

resource "snowflake_schema" "test_sandbox" {
  database  = "TEST_DB"
  name      = "SANDBOX"
  comment   = "Sandbox schema"
}

resource "snowflake_schema" "test_archive" {
  database  = "TEST_DB"
  name      = "ARCHIVE"
  comment   = "Archived data"
}

# TELEMETRY_DB
resource "snowflake_schema" "telemetry_bronze_accelbyte" {
  database  = "TELEMETRY_DB"
  name      = "BRONZE_ACCELBYTE"
  comment   = "For AccelByte events"
}

resource "snowflake_schema" "telemetry_bronze_helika" {
  database  = "TELEMETRY_DB"
  name      = "BRONZE_HELIKA"
  comment   = "For Helika events"
}

resource "snowflake_schema" "telemetry_bronze_web" {
  database  = "TELEMETRY_DB"
  name      = "BRONZE_WEB"
  comment   = "For Yuga website events"
}

resource "snowflake_schema" "telemetry_sandbox" {
  database  = "TELEMETRY_DB"
  name      = "SANDBOX"
  comment   = "Sandbox schema"
}

resource "snowflake_schema" "telemetry_archive" {
  database  = "TELEMETRY_DB"
  name      = "ARCHIVE"
  comment   = "Archived data"
}

# DATASCIENCE_DB
resource "snowflake_schema" "datascience_sandbox" {
  database  = "DATASCIENCE_DB"
  name      = "SANDBOX"
  comment   = "Sandbox schema"
}

resource "snowflake_schema" "datascience_archive" {
  database  = "DATASCIENCE_DB"
  name      = "ARCHIVE"
  comment   = "Archived data"
}

resource "snowflake_schema" "datascience_bronze_sigma" {
  database  = "DATASCIENCE_DB"
  name      = "BRONZE_SIGMA"
  comment   = "Data from Sigma Computing (csv uploads, input tables, etc.)"
}

# https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/warehouse
# https://docs.snowflake.com/en/sql-reference/sql/create-warehouse for default values
resource "snowflake_warehouse" "compute" {
  name                          = "COMPUTE_WH"
  comment                       = "Main warehouse Account Admin, etc."
  warehouse_size                = "xsmall"
  auto_suspend                  = 60  # in seconds
  initially_suspended           = true
  # https://yuga-labs.atlassian.net/wiki/spaces/DAAK/pages/301400083/Snowflake+Cost+Monitoring
  statement_timeout_in_seconds  = 36000
}

resource "snowflake_warehouse" "etl" {
  name                          = "ETL_WH"
  comment                       = "Main warehouse for all scheduled ingest, transform, etc. activities"
  warehouse_size                = "xsmall"
  auto_suspend                  = 60  # in seconds
  initially_suspended           = true
  # https://yuga-labs.atlassian.net/wiki/spaces/DAAK/pages/301400083/Snowflake+Cost+Monitoring
  statement_timeout_in_seconds  = 36000
}

resource "snowflake_warehouse" "datascience" {
  name                          = "DATASCIENCE_WH"
  comment                       = "Main warehouse for Data Science (non-scheduled) usage"
  warehouse_size                = "xsmall"
  auto_suspend                  = 60  # in seconds
  initially_suspended           = true
  # https://yuga-labs.atlassian.net/wiki/spaces/DAAK/pages/301400083/Snowflake+Cost+Monitoring
  statement_timeout_in_seconds  = 36000
}
