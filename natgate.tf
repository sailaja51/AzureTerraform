provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "nat-gateway-example-rg"
  location = "West Europe"
}

resource "azurerm_public_ip" "example" {
  name                = "nat-gateway-publicIP"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_public_ip_prefix" "example" {
  name                = "nat-gateway-publicIPPrefix"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  prefix_length       = 30
}

resource "azurerm_nat_gateway" "example" {
  name                    = "nat-Gateway"
  location                = azurerm_resource_group.example.location
  resource_group_name     = azurerm_resource_group.example.name
  public_ip_address_ids   = [azurerm_public_ip.example.id]
  public_ip_prefix_ids    = [azurerm_public_ip_prefix.example.id]
  sku_name                = "Standard"
  idle_timeout_in_minutes = 10
}