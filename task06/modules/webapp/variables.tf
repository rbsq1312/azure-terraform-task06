# WebApp module - variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "app_service_plan_name" {
  description = "The name of the App Service Plan"
  type        = string
}

variable "app_service_plan_sku" {
  description = "The SKU of the App Service Plan"
  type        = string
}

variable "web_app_name" {
  description = "The name of the Web App"
  type        = string
}

variable "dotnet_version" {
  description = "The version of .NET to use for the Web App"
  type        = string
}

variable "sql_connection_string" {
  description = "The connection string for the SQL database"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}
