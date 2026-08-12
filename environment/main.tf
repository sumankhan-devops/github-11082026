module "azurerm_resource_group" {
  source = "../Child-Module/Azurerm_Resource_Group"

  rgdetails = var.rgdetails

}

module "azurerm_virtual_network" {
  source      = "../Child-Module/Azurerm_Virtual_Network"
  vnetdetails = var.vnetdetails
  depends_on  = [module.azurerm_resource_group]
}


module "azurerm_subnet" {
  source        = "../Child-Module/Azurerm_Subnet"
  subnetdetails = var.subnetdetails
  depends_on    = [module.azurerm_virtual_network]
}

module "azurerm_nsg" {
  source     = "../Child-Module/Azurerm_nsg"
  nsgdetails = var.nsgdetails
  depends_on = [module.azurerm_subnet]
}

module "azurerm_virtual_nic" {
  source     = "../Child-Module/Azurerm_Virtual_Nic"
  winnic     = var.winnic
  depends_on = [module.azurerm_nsg]
}

module "azurerm_public_ip" {
  source          = "../Child-Module/Azurerm_Public_Ip"
  Publicipdetails = var.Publicipdetails
  depends_on      = [module.azurerm_virtual_nic]
}

module "azurerm_bastion_host" {
  source         = "../Child-Module/Azurerm_bastion"
  bastiondetails = var.bastiondetails
  depends_on     = [module.azurerm_public_ip]
}

module "azurerm_windows_virtual_machine" {
  source     = "../Child-Module/Azurerm_Virtual_Machine"
  vmdetails  = var.vmdetails
  depends_on = [module.azurerm_bastion_host]

}