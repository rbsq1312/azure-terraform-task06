# SQL Server module - main.tf

# Generate random password for SQL admin
resource "random_password" "sql_admin_password" {
  length           = 16
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
  min_special      = 2
}

# Store SQL admin credentials in Key Vault
resource "azurerm_key_vault_secret" "sql_admin_name" {
  name         = var.kv_secret_name_admin
  value        = var.sql_admin_username
  key_vault_id = var.key_vault_id
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = var.kv_secret_name_password
  value        = random_password.sql_admin_password.result
  key_vault_id = var.key_vault_id
}

# Create Azure SQL Server
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = random_password.sql_admin_password.result

  tags = var.tags
}

# Create firewall rule to allow connections from Azure services
resource "azurerm_mssql_firewall_rule" "allow_azure_services" {
  name             = "AllowAzureServices"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}

# Create firewall rule to allow connections from a specific IP address
resource "azurerm_mssql_firewall_rule" "allow_specific_ip" {
  name             = var.firewall_rule_name
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.allowed_ip_address
  end_ip_address   = var.allowed_ip_address
}

# Create SQL Database
resource "azurerm_mssql_database" "sql_db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.sql_db_sku

  tags = var.tags
}
