# variables.tf - Input variables for the root module

variable "name_pattern" {
  description = "Prefix for resource names"
  type        = string
  default     = "cmaz-49b8ddc2-mod6"
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
  default     = "North Europe"
}

variable "kv_rg_name" {
  description = "The name of the resource group containing the Key Vault"
  type        = string
}

variable "kv_name" {
  description = "The name of the Key Vault"
  type        = string
}

variable "kv_secret_name_admin" {
  description = "The name of the Key Vault secret for SQL admin username"
  type        = string
}

variable "kv_secret_name_password" {
  description = "The name of the Key Vault secret for SQL admin password"
  type        = string
}

variable "sql_db_sku" {
  description = "The SKU of the SQL database"
  type        = string
}

variable "firewall_rule_name" {
  description = "The name of the SQL server firewall rule"
  type        = string
}

variable "allowed_ip_address" {
  description = "The IP address allowed to connect to SQL server"
  type        = string
}

variable "app_service_plan_sku" {
  description = "The SKU of the App Service Plan"
  type        = string
}

variable "dotnet_version" {
  description = "The version of .NET to use for the Web App"
  type        = string
}

variable "creator_tag" {
  description = "Creator tag value"
  type        = string
}
