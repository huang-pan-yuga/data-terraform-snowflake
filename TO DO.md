DO NOT TERRAFORM Snowflake, see: https://docs.google.com/document/d/17rwW22IVvxU4zzFIjQhIYXJ9WnbewIaOj0BPBe4HGBI/edit?usp=sharing

DONE: Work through Snowflake setup SQL code first: https://docs.snowflake.com/en/user-guide/security-access-control-privileges
- user
- role
- warehouse
- database
- schema
- future tables / views
DONE: local terraform init / apply, push / pull to remote state
DONE: terraform cloud backend - import


match .tf with SQL setup code
use non-deprecated terraform functions: schema / table / warehouse grants 
  https://registry.terraform.io/providers/Snowflake-Labs/snowflake/latest/docs/resources/grant_privileges_to_account_role
try terraform destroy all


secrets: variables, terraform cloud
sensitive info: 1password integration

format terraform project files: modules, local vars / dynamic blocks
See PoC notes https://docs.google.com/document/d/1a43fiK8RKDF33KmtYgybGdC6Xgx9WoFby3AzuWeZE4Q/edit?usp=sharing for things to put into Terraform
TF videos: missed anything in tf files? Providers?
terraform git repos: AWS + Terraform cloud structure, like engineering AWS terraform repos https://github.com/yuga-labs/devops-infrastructure/tree/main/terraform 



non-terraform: - TELEMETRY_DB.BRONZE_HELIKA: storage integration, file format, stage, pipe
Hex data admin, git repo