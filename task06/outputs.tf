# outputs.tf - Output values from the root module

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL server"
  value       = module.sql.sql_server_fqdn
}

output "app_hostname" {
  description = "The hostname of the Web App"
  value       = module.webapp.app_hostname
}
