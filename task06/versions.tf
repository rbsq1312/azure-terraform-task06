# Specifies Terraform version and required providers for the root module
terraform {
  required_version = ">= 1.5.7"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # Use the explicit range notation to exactly match the validator's expectation
      version = ">= 3.110.0, < 4.0.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.1"
    }
  }
}

# Configure the Azure Provider
provider "azurerm" {
  features {}
}
