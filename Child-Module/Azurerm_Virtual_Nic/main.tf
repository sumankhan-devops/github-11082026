resource "azurerm_network_interface" "win" {
  for_each = var.winnic

  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "configuration1"
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_address_allocation
  }
}

resource "azurerm_network_interface_security_group_association" "suman-nsg-association" {
  for_each = var.winnic
  network_interface_id      = azurerm_network_interface.win[each.key].id
  network_security_group_id = each.value.network_security_group_id
}