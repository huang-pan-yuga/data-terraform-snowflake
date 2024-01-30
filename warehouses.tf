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
