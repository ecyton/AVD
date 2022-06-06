output "appgrnm" {
  value = azurerm_virtual_desktop_application_group.desktopapp.name
}

output "hpnm" {
  value = azurerm_virtual_desktop_host_pool.hostpool.name
}