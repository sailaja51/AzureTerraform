provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_cdn_profile" "example" {
  name                = "exampleCdnProfile"
  location            = "West US"
  resource_group_name = azurerm_resource_group.example.name
  sku                 = "Standard_Microsoft"

  tags = {
    environment = "Production"
    cost_center = "MSFT"
  }
}