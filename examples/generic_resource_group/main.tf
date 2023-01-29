provider "azurerm" {
  features {}
}
data "azurerm_subscription" "current" {}

module "generic_resource_group" {
    source =  "../../modules/generic_resource_group"
    ressource_group_config = var.ressource_group_config
}