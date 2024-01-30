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
