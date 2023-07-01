# Getting the centralized azure firewall
data "azurerm_firewall" "hub" {
  name                = var.hub_firewall_name
  resource_group_name = var.hub_firewall_resource_group_name
}

# Getting the hub virtual network
data "azurerm_virtual_network" "hub" {
  name                = var.hub_virtual_network_name
  resource_group_name = var.hub_virtual_network_resource_group_name
}

# Getting the spoke virtual network
data "azurerm_virtual_network" "spoke" {
  # Using the spoke subscription id
  provider            = azurerm.spoke
  name                = var.spoke_virtual_network_name
  resource_group_name = var.spoke_virtual_network_resource_group_name
}
