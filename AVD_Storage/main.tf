resource "azurerm_storage_account" "sa" {
  name                     = var.sa_name
  resource_group_name      = var.rg_name
  location                 = var.deploy_location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}