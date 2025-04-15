# main.tf - Main configuration for the three-tier solution

# Data source to access the existing Key Vault
data "azurerm_key_vault" "existing_kv" {
  name                = var.kv_name
  resource_group_name = var.kv_rg_name
}

# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
  tags     = local.common_tags
}

# SQL Server module
module "sql" {
  source = "./modules/sql"
  
  resource_group_name    = azurerm_resource_group.rg.name
  location               = var.location
  sql_server_name        = local.sql_server_name
  sql_db_name            = local.sql_db_name
  sql_db_sku             = var.sql_db_sku
  sql_admin_username     = local.sql_admin_username
  tags                   = local.common_tags
  key_vault_id           = data.azurerm_key_vault.existing_kv.id
  kv_secret_name_admin   = var.kv_secret_name_admin
  kv_secret_name_password = var.kv_secret_name_password
  allowed_ip_address     = var.allowed_ip_address
  firewall_rule_name     = var.firewall_rule_name
}

# WebApp module
module "webapp" {
  source = "./modules/webapp"
  
  resource_group_name     = azurerm_resource_group.rg.name
  location                = var.location
  app_service_plan_name   = local.asp_name
  app_service_plan_sku    = var.app_service_plan_sku
  web_app_name            = local.app_name
  dotnet_version          = var.dotnet_version
  sql_connection_string   = module.sql.sql_connection_string
  tags                    = local.common_tags

  depends_on = [module.sql]
}
