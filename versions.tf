terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = ">=0.84.1"      
    }
  }
  cloud {
    organization = "yuga-test"
    workspaces {
      name = "data-terraform-snowflake"
    }
  }
}
