# Terrafrom generic resource group module

A terraform module to provide a generic\_resource\_group in AZURE.

This should be used an a generic template to be included in every terraform module.

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.41.0 |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.rg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [null_resource.terraform-docs](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ressource_group_config"></a> [ressource\_group\_config](#input\_ressource\_group\_config) | Configuration to deploy multiple resource groups | <pre>map(object({<br>        location = string<br>        tags = object({<br>            stage = string<br>            })<br>    }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_groups"></a> [resource\_groups](#output\_resource\_groups) | Outputs for all created resource groups |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | Subscription Id for the current session |
