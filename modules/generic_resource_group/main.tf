
provider "azurerm" {
  features {}
}
data "azurerm_subscription" "current" {}

resource "azurerm_resource_group" "rg" {
    for_each = var.ressource_group_config
    name     = each.key
    location = each.value.location
    tags = each.value.tags
}