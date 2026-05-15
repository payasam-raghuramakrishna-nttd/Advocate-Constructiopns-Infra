
output "subnet_ids" {
  value = [for subnet in values(azurerm_subnet.subnet) : subnet.id]
}
