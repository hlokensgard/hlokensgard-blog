# Azure Private DNS Resolver
Code used to implement `azure private dns resolver` into an Azure Landing Zone architecture.
This code implements the following:
- Azure Private DNS Resolver
- Inbound subnet for the Private DNS Resolver
- Outbound subnet for the Private DNS Resolver
- Rules for the Private DNS Resolver

See the [blog]() for more information about this repository and Azure Private DNS Resolver.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~>1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.63.0 |
| <a name="provider_azurerm.spoke"></a> [azurerm.spoke](#provider\_azurerm.spoke) | 3.63.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_private_dns_resolver.hub_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver) | resource |
| [azurerm_private_dns_resolver_inbound_endpoint.hub_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_inbound_endpoint) | resource |
| [azurerm_private_dns_resolver_outbound_endpoint.hub_network](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_resolver_outbound_endpoint) | resource |
| [azurerm_resource_group.private_dns_resolver](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group) | resource |
| [azurerm_subnet.private_dns_resolver_inbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_subnet.private_dns_resolver_outbound](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/subnet) | resource |
| [azurerm_firewall.hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/firewall) | data source |
| [azurerm_virtual_network.hub](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |
| [azurerm_virtual_network.spoke](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/virtual_network) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hub_firewall_name"></a> [hub\_firewall\_name](#input\_hub\_firewall\_name) | The name of the hub firewall | `string` | n/a | yes |
| <a name="input_hub_firewall_resource_group_name"></a> [hub\_firewall\_resource\_group\_name](#input\_hub\_firewall\_resource\_group\_name) | The name of the hub firewall resource group | `string` | n/a | yes |
| <a name="input_hub_virtual_network_name"></a> [hub\_virtual\_network\_name](#input\_hub\_virtual\_network\_name) | The name of the hub virtual network | `string` | n/a | yes |
| <a name="input_hub_virtual_network_resource_group_name"></a> [hub\_virtual\_network\_resource\_group\_name](#input\_hub\_virtual\_network\_resource\_group\_name) | The name of the hub virtual network resource group | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | The location of the resources | `string` | n/a | yes |
| <a name="input_private_dns_resolver_inbound_address_prefixes"></a> [private\_dns\_resolver\_inbound\_address\_prefixes](#input\_private\_dns\_resolver\_inbound\_address\_prefixes) | Value of the address prefixes for the private dns resolver inbound subnet | `list(string)` | n/a | yes |
| <a name="input_private_dns_resolver_outbound_address_prefixes"></a> [private\_dns\_resolver\_outbound\_address\_prefixes](#input\_private\_dns\_resolver\_outbound\_address\_prefixes) | Value of the address prefixes for the private dns resolver outbound subnet | `list(string)` | n/a | yes |
| <a name="input_spoke_subscription_id"></a> [spoke\_subscription\_id](#input\_spoke\_subscription\_id) | The subscription id for the spoke subscription | `string` | n/a | yes |
| <a name="input_spoke_virtual_network_name"></a> [spoke\_virtual\_network\_name](#input\_spoke\_virtual\_network\_name) | The name of the spoke virtual network | `string` | n/a | yes |
| <a name="input_spoke_virtual_network_resource_group_name"></a> [spoke\_virtual\_network\_resource\_group\_name](#input\_spoke\_virtual\_network\_resource\_group\_name) | The name of the spoke virtual network resource group | `string` | n/a | yes |
| <a name="input_subscription_id_connectivity"></a> [subscription\_id\_connectivity](#input\_subscription\_id\_connectivity) | The subscription id for the connectivity subscription | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->