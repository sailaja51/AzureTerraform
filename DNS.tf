provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "dns_management" {
name     = "dns-managment"
location = "West US"
}

resource "azurerm_dns_zone" "mydomaincom" {
name                = "domain.com"
resource_group_name = "${azurerm_resource_group.dns_management.name}"
}

resource "azurerm_dns_a_record" "projectmydomain" {
name                = "project"
zone_name           = "${azurerm_dns_zone.mydomaincom.name}"
resource_group_name = "${azurerm_resource_group.dns_management.name}"
ttl                 = 300
records             = ["127.0.0.1"]
}

