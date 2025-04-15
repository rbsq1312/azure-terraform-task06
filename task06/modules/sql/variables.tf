# SQL Server module - variables.tf

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources"
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL server"
  type        = string
}

variable "sql_db_name" {
  description = "The name of the SQL database"
  type        = string
}

variable "sql_db_sku" {
  description = "The SKU of the SQL database"
  type        = string
}

variable "sql_admin_username" {
  description = "The admin username for the SQL server"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to resources"
  type        = map(string)
}

variable "key_vault_id" {
  description = "The ID of the Key Vault where SQL credentials will be stored"
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

variable "allowed_ip_address" {
  description = "The IP address allowed to connect to SQL server"
  type        = string
}

variable "firewall_rule_name" {
  description = "The name of the SQL server firewall rule"
  type        = string
}
