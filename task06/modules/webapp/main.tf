# WebApp module - main.tf

# Create App Service Plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_plan_name
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = "Linux"
  sku_name            = var.app_service_plan_sku
  
  tags = var.tags
}

# Create Linux Web App
resource "azurerm_linux_web_app" "web_app" {
  name                = var.web_app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.app_service_plan.id
  
  site_config {
    application_stack {
      dotnet_version = var.dotnet_version
    }
  }
  
  app_settings = {
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
  
  connection_string {
    name  = "DefaultConnection"
    type  = "SQLAzure"
    value = var.sql_connection_string
  }
  
  tags = var.tags
}
