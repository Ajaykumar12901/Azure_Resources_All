# resoure group
rgs = {
  "rg1" = {
    rg_name    = "ajay1122"
    location   = "Central India"
    managed_by = "terraform"
    tags = {
      owner       = "ajay"
      team        = "devopsg2"
      enviornment = "dev"
    }
  }

}

storage_account = {
  "stg1" = {
    name                     = "ajaystg1234"
    resource_group_name      = "ajay1122"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"

  }
}

# Vnet
vnet = {
  "vnet1" = {
    vnet_name           = "ajayvnet"
    resource_group_name = "ajay1122"
    location            = "Central India"
    address_space       = ["10.0.0.0/16"]
  }
}

# Subnets
subnets = {
  "sub01" = {
    name                 = "frontend_subnet"
    resource_group_name  = "ajay1122"
    virtual_network_name = "ajayvnet"
    address_prefixes     = ["10.0.1.0/24"]
  }
  "sub02" = {
    name                 = "backend_subnet"
    resource_group_name  = "ajay1122"
    virtual_network_name = "ajayvnet"
    address_prefixes     = ["10.0.2.0/24"]
  }
}

#NSG
nerwork_security_group = {
  nsg1 = {
    nsg_name            = "frontend_nsg"
    resource_group_name = "ajay1122"
    location            = "Central India"
    security_rule = {
      rule1 = {
        name                       = "ajay11"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["80", "8080", "10000-10010"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }

  nsg2 = {
    nsg_name            = "backend_nsg"
    resource_group_name = "ajay1122"
    location            = "Central India"
    security_rule = {
      rule1 = {
        name                       = "ajay22"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_ranges    = ["80", "8080", "10000-10010"]
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    }
  }
}

# Public IP
public_ip = {
  "pip1" = {
    name                = "frontend_pip"
    resource_group_name = "ajay1122"
    location            = "Central India"
    allocation_method   = "Static"
  }

  "pip2" = {
    name                = "backend_pip"
    resource_group_name = "ajay1122"
    location            = "Central India"
    allocation_method   = "Static"
  }
}

# NIC
network_interface = {
  "nic1" = {
    name                = "frontend_nic"
    resource_group_name = "ajay1122"
    location            = "Central India"
    ip_configuration = [{
      name                          = "frontend_ip_config"
      private_ip_address_allocation = "Dynamic"
      subnet_name                   = "frontend_subnet"
      virtual_network_name          = "ajayvnet"
      pip_name                      = "frontend_pip"

    }]
  }

  "nic2" = {
    name                = "backend_nic"
    resource_group_name = "ajay1122"
    location            = "Central India"
    ip_configuration = [{
      name                          = "backend_ip_config"
      private_ip_address_allocation = "Dynamic"
      subnet_name                   = "backend_subnet"
      virtual_network_name          = "ajayvnet"
      pip_name                      = "backend_pip"

    }]
  }
}

vm = {
  vm1 = {
    name                = "frontendvm"
    resource_group_name = "ajay1122"
    location            = "Central India"
    # admin_username                  = "adminuser"
    # admin_password                  = "Ajay@123456789"
    disable_password_authentication = "false"
    size                            = "Standard_D2s_v3"
    nic_name                        = "frontend_nic"
    kv_name                         = "ajay09kv02"
    secret_name                     = "vmusername"
    secret_password                 = "vmpassword"


    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    name                = "backendvm"
    resource_group_name = "ajay1122"
    location            = "Central India"
    # admin_username                  = "adminuser"
    # admin_password                  = "Ajay@123456789"
    disable_password_authentication = "false"
    size                            = "Standard_D2s_v3"
    nic_name                        = "backend_nic"
    kv_name                         = "ajay09kv02"
    secret_name                     = "vmusername"
    secret_password                 = "vmpassword"

    os_disk = {
      caching              = "ReadWrite"
      storage_account_type = "Standard_LRS"
    }

    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

keyvault = {
  "kv1" = {
    kv_name                     = "ajay09kv02"
    resource_group_name         = "ajay1122"
    location                    = "Central India"
    enabled_for_disk_encryption = true
    sku_name                    = "standard"
    soft_delete_enabled         = 7
    purge_protection_enabled    = false
  }
}

kvs = {
  "secret1" = {
    kv_name             = "ajay09kv02"
    resource_group_name = "ajay1122"
    secret_name         = "vmusername"
    secret_value        = "adminuser"
  }
  "secret2" = {
    kv_name             = "ajay09kv02"
    resource_group_name = "ajay1122"
    secret_name         = "vmpassword"
    secret_value        = "Password@123456"
  }
  "secret3" = {
    kv_name             = "ajay09kv02"
    resource_group_name = "ajay1122"
    secret_name         = "sqlservername"
    secret_value        = "sqladminsuer"
  }
  "secret4" = {
    kv_name             = "ajay09kv02"
    resource_group_name = "ajay1122"
    secret_name         = "sqlserverpassword"
    secret_value        = "Password@123456"
  }
}


sql_servers = {
  "server1" = {
    server_name         = "ajayserver02"
    resource_group_name = "ajay1122"
    location            = "Central India"
    version             = "12.0"
    sql_user         = "sqlservername"
    sql_password        = "sqlserverpassword"
    kv_name             = "ajay09kv02"
  }
}

sql_databases = {
  "db1" = {
    databse_name        = "ajaydb11"
    server_name         = "ajayserver02"
    resource_group_name = "ajay1122"

  }
}
