output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL Server"
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "The hostname of the Web Application"
  value       = module.webapp.web_app_hostname
}
