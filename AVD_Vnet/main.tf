resource "azurerm_virtual_network" "myvnet" {
  name = var.vnet_name
  location            = var.deploy_location
  resource_group_name = var.rg_name
    address_space = ["10.0.0.0/16"]
}

resource "azurerm_subnet" "mysubnet" {
  name                 = var.subnet_name
  resource_group_name  = var.rg_name
  virtual_network_name = var.vnet_name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [
    azurerm_virtual_network.myvnet
  ]
}