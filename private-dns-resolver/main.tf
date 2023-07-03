provider "azurerm" {
  subscription_id = var.subscription_id_connectivity
  features {}
}

# Creating the resource group for the private dns resolver
resource "azurerm_resource_group" "private_dns_resolver" {
  name     = "private-dns-resolver-rg"
  location = var.location
}

# Creating the private dns resolver
resource "azurerm_private_dns_resolver" "hub_network" {
  name                = "private-dns-resolver-hub"
  resource_group_name = azurerm_resource_group.private_dns_resolver.name
  location            = azurerm_resource_group.private_dns_resolver.location
  virtual_network_id  = data.azurerm_virtual_network.hub.id
}

# Creating the inbound subnet for the private dns resolver
resource "azurerm_subnet" "private_dns_resolver_inbound" {
  name                 = "private-dns-resolver-inbound"
  resource_group_name  = data.azurerm_virtual_network.hub.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.hub.name
  address_prefixes     = var.private_dns_resolver_inbound_address_prefixes

  # Creating the delegation for the inbound subnet
  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

# Creating the outbound subnet for the private dns resolver
resource "azurerm_subnet" "private_dns_resolver_outbound" {
  name                 = "private-dns-resolver-outbound"
  resource_group_name  = data.azurerm_virtual_network.hub.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.hub.name
  address_prefixes     = var.private_dns_resolver_outbound_address_prefixes

  # Creating the delegation for the outbound subnet
  delegation {
    name = "Microsoft.Network.dnsResolvers"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/join/action"]
      name    = "Microsoft.Network/dnsResolvers"
    }
  }
}

# Creating the private inbound endpoint for the private dns resolver
resource "azurerm_private_dns_resolver_inbound_endpoint" "hub_network" {
  name                    = "inbound-endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.hub_network.id
  location                = azurerm_private_dns_resolver.hub_network.location
  ip_configurations {
    private_ip_allocation_method = "Dynamic"
    subnet_id                    = azurerm_subnet.private_dns_resolver_inbound.id
  }
}

# Creating the private outbound endpoint for the private dns resolver
resource "azurerm_private_dns_resolver_outbound_endpoint" "hub_network" {
  name                    = "outbound-endpoint"
  private_dns_resolver_id = azurerm_private_dns_resolver.hub_network.id
  location                = azurerm_private_dns_resolver.hub_network.location
  subnet_id               = azurerm_subnet.private_dns_resolver_outbound.id
}
