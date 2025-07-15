provider "azurerm" {
  features {
}
}
resource "azurerm_resource_group" "example" {
  name     = "terrres"
  location = "eastus"
}
