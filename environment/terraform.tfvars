#RG
rgdetails = {
  rg1 = {
    name     = "rg-suman"
    location = "central india"
  }
}

#Vnet
vnetdetails = {
    vnet1={
    name                = "vnet-suman"
  location            = "central india"
  resource_group_name = "rg-suman"
  address_space       = ["172.16.0.0/16"]
  dns_servers         = ["8.8.8.8"] 
    }
}

#Subnet
subnetdetails= {

    subnet1= {
    name                 = "frontend-subnet"
  resource_group_name  = "rg-suman"
  virtual_network_name = "vnet-suman"
  address_prefixes     = ["172.16.1.0/24"]
    }
    subnet2= {
    name                 = "backend-subnet"
  resource_group_name  = "rg-suman"
  virtual_network_name = "vnet-suman"
  address_prefixes     = ["172.16.2.0/24"]
    }
    bastion_subnet = {

    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-suman"
    virtual_network_name = "vnet-suman"
    address_prefixes     = ["172.16.3.0/24"]
  }
}

#NSG
nsgdetails = {
  nsg1 = {

    name                = "suman-nsg"
    location            = "central india"
    resource_group_name = "rg-suman"

    security_rule = [{
      name                       = "SSH-Inbound"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
      },

      {
        name                       = "SSH-Outbound"
        priority                   = 120
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "HTTP-Inbound"
        priority                   = 130
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "HTTP-Outbound"
        priority                   = 140
        direction                  = "Outbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "80"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      },
      {
        name                       = "RDP-Inbound"
        priority                   = 150
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3389"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }


    ]
  }
}

#Virtual-NIC

winnic = {
    nic1= {
    name                = "win-vm-nic"
  location            = "central india"
  resource_group_name = "rg-suman"

    subnet_id                     = "/subscriptions/b2633361-304d-45b9-b515-900e2354bd23/resourceGroups/rg-suman/providers/Microsoft.Network/virtualNetworks/vnet-suman/subnets/frontend-subnet"

    private_ip_address_allocation = "Dynamic"
    
    network_security_group_id = "/subscriptions/b2633361-304d-45b9-b515-900e2354bd23/resourceGroups/rg-suman/providers/Microsoft.Network/networkSecurityGroups/suman-nsg"

    }
}

# PIP
Publicipdetails = {
    Publicip1 = {
name                = "bastion-publicip"
  resource_group_name = "rg-suman"
  location            = "central india"
  allocation_method   = "Static"
    }
    
}

#Bastion

bastiondetails = {
bastion1={
name                = "bastion-suman"
  location            = "central india"
  resource_group_name = "rg-suman"

  ip_configuration ={
    name                 = "configuration"
    subnet_id            = "/subscriptions/b2633361-304d-45b9-b515-900e2354bd23/resourceGroups/rg-suman/providers/Microsoft.Network/virtualNetworks/vnet-suman/subnets/AzureBastionSubnet"
    public_ip_address_id = "/subscriptions/b2633361-304d-45b9-b515-900e2354bd23/resourceGroups/rg-suman/providers/Microsoft.Network/publicIPAddresses/bastion-publicip"
}
}
}

#VM

vmdetails = {
  vm1={
    name              = "vm-suman"
  resource_group_name = "rg-suman"
  location            = "central india"
  size                = "Standard_D4_v5"
  admin_username      = "adminuser"
  admin_password      = "Suman@1234"
  network_interface_ids = "/subscriptions/b2633361-304d-45b9-b515-900e2354bd23/resourceGroups/rg-suman/providers/Microsoft.Network/networkInterfaces/win-vm-nic"
  

  
  os_disk ={
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

 source_image_reference ={
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}
}