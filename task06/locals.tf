# locals.tf - Resource names created using Terraform functions

locals {
  # Using format function to create resource names
  rg_name         = format("%s-rg", var.name_pattern)
  sql_server_name = format("%s-sql", var.name_pattern)
  sql_db_name     = format("%s-sql-db", var.name_pattern)
  asp_name        = format("%s-asp", var.name_pattern)
  app_name        = format("%s-app", var.name_pattern)

  # SQL admin username
  sql_admin_username = "sqladmin"

  # Common tags for all resources
  common_tags = {
    Creator = var.creator_tag
  }
}
