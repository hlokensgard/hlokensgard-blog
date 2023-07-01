variable "subscription_id_connectivity" {
  description = "The subscription id for the connectivity subscription"
  type        = string
}

variable "location" {
  description = "The location of the resources"
  type        = string
}

variable "hub_virtual_network_name" {
  description = "The name of the hub virtual network"
  type        = string
}

variable "hub_virtual_network_resource_group_name" {
  description = "The name of the hub virtual network resource group"
  type        = string
}

variable "spoke_virtual_network_name" {
  description = "The name of the spoke virtual network"
  type        = string
}

variable "spoke_virtual_network_resource_group_name" {
  description = "The name of the spoke virtual network resource group"
  type        = string
}

variable "spoke_subscription_id" {
  description = "The subscription id for the spoke subscription"
  type        = string
}

variable "hub_firewall_name" {
  description = "The name of the hub firewall"
  type        = string
}

variable "hub_firewall_resource_group_name" {
  description = "The name of the hub firewall resource group"
  type        = string
}

variable "private_dns_resolver_outbound_address_prefixes" {
  description = "Value of the address prefixes for the private dns resolver outbound subnet"
  type        = list(string)
}

variable "private_dns_resolver_inbound_address_prefixes" {
  description = "Value of the address prefixes for the private dns resolver inbound subnet"
  type        = list(string)
}