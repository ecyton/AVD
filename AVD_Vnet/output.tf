output "vnetnm" {
  value = azurerm_virtual_network.myvnet.name
}

output "subnetnm" {
  value = azurerm_virtual_network.myvnet.subnet.name
}