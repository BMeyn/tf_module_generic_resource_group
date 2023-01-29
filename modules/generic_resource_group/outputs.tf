output "resource_groups" {
  value = {for k, v in azurerm_resource_group.rg: k => {
    name = v.name
    location = v.location 
    tags = v.tags
  }}
  description = "Outputs for all created resource groups"
}

output "subscription_id" {
  value = data.azurerm_subscription.current.subscription_id
}