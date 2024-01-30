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
