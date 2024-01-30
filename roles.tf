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
