variable "snowflake_account" {
  description = "The Snowflake account for resources to be loaded into."
  type        = string
}

variable "snowflake_user" {
  description = "The username for the Snowflake Terraform user"
  sensitive   = true
  type        = string
}

variable "snowflake_user_password" {
  description = "The password for the Snowflake Terraform user"
  sensitive   = true
  type        = string
}

variable "snowflake_user_role" {
  description = "The role of the Terraform user."
  type        = string
}

variable "snowflake_user_email" {
  description = "The email of the Terraform user."
  type        = string
}
