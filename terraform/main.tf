provider "azurerm" {
  features {}

  subscription_id = "AZURE_SUBSCRIPTION_ID"
  client_id       = "AZURE_CLIENT_ID"
  client_secret   = "AZURE_CLIENT_SECRET"
  tenant_id       = "AZURE_TENANT_ID"
}

resource "azurerm_resource_group" "example" {
  name     = 'terrres'
  location = 'eastus'
}
