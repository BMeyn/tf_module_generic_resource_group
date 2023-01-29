/**
  * # Terrafrom generic resource group module
  *
  *
  * A terraform module to provide a generic_resource_group in AZURE.
  *
  * This should be used an a generic template to be included in every terraform module.
  *
  */
resource "null_resource" "terraform-docs" {

}

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