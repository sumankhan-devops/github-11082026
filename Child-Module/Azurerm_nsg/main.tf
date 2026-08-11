resource "azurerm_network_security_group" "nsg-suman" {
    for_each = var.nsgdetails
    name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  security_rule {
    name                       = each.value.security_rule[0].name
    direction                  = each.value.security_rule[0].direction
    priority                   = each.value.security_rule[0].priority
    access                     = each.value.security_rule[0].access
    protocol                   = each.value.security_rule[0].protocol
    source_port_range          = each.value.security_rule[0].source_port_range
    destination_port_range     = each.value.security_rule[0].destination_port_range
    source_address_prefix      = each.value.security_rule[0].source_address_prefix
    destination_address_prefix = each.value.security_rule[0].destination_address_prefix

  }
  security_rule {
    name                       = each.value.security_rule[1].name
    direction                  = each.value.security_rule[1].direction
    priority                   = each.value.security_rule[1].priority
    access                     = each.value.security_rule[1].access
    protocol                   = each.value.security_rule[1].protocol
    source_port_range          = each.value.security_rule[1].source_port_range
    destination_port_range     = each.value.security_rule[1].destination_port_range
    source_address_prefix      = each.value.security_rule[1].source_address_prefix
    destination_address_prefix = each.value.security_rule[1].destination_address_prefix
  }
  security_rule {
    name                       = each.value.security_rule[2].name
    direction                  = each.value.security_rule[2].direction
    priority                   = each.value.security_rule[2].priority
    access                     = each.value.security_rule[2].access
    protocol                   = each.value.security_rule[2].protocol
    source_port_range          = each.value.security_rule[2].source_port_range
    destination_port_range     = each.value.security_rule[2].destination_port_range
    source_address_prefix      = each.value.security_rule[2].source_address_prefix
    destination_address_prefix = each.value.security_rule[2].destination_address_prefix

  }
  security_rule {
    name                       = each.value.security_rule[3].name
    direction                  = each.value.security_rule[3].direction
    priority                   = each.value.security_rule[3].priority
    access                     = each.value.security_rule[3].access
    protocol                   = each.value.security_rule[3].protocol
    source_port_range          = each.value.security_rule[3].source_port_range
    destination_port_range     = each.value.security_rule[3].destination_port_range
    source_address_prefix      = each.value.security_rule[3].source_address_prefix
    destination_address_prefix = each.value.security_rule[3].destination_address_prefix

  }
  security_rule {
    name                       = each.value.security_rule[4].name
    direction                  = each.value.security_rule[4].direction
    priority                   = each.value.security_rule[4].priority
    access                     = each.value.security_rule[4].access
    protocol                   = each.value.security_rule[4].protocol
    source_port_range          = each.value.security_rule[4].source_port_range
    destination_port_range     = each.value.security_rule[4].destination_port_range
    source_address_prefix      = each.value.security_rule[4].source_address_prefix
    destination_address_prefix = each.value.security_rule[4].destination_address_prefix

  }

}


  
