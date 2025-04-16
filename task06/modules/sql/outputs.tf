# SQL Server module - outputs.tf

output "sql_server_id" {
  description = "The ID of the SQL server"
  value       = azurerm_mssql_server.sql_server.id
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL server"
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_database_id" {
  description = "The ID of the SQL database"
  value       = azurerm_mssql_database.sql_db.id
}

output "sql_connection_string" {
  description = "The ADO.NET connection string for the SQL database"
  sensitive   = true
  value       = "Server=tcp:${azurerm_mssql_server.sql_server.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.sql_db.name};Persist Security Info=False;User ID=${var.sql_admin_username};Password=${random_password.sql_admin_password.result};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
}
