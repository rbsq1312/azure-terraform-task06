# WebApp module - outputs.tf
output "app_service_plan_id" {
  description = "The ID of the App Service Plan"
  value       = azurerm_service_plan.app_service_plan.id
}

output "web_app_id" {
  description = "The ID of the Web App"
  value       = azurerm_linux_web_app.web_app.id
}

output "web_app_hostname" {
  description = "The hostname of the Web App"
  value       = azurerm_linux_web_app.web_app.default_hostname
}
