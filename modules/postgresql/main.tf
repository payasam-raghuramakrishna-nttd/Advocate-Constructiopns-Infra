
resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  administrator_login    = var.admin_username
  administrator_password = var.admin_password
  version                = "14"
  sku_name               = var.postgresql_sku != null ? var.postgresql_sku : "B_Standard_B2s"
  storage_mb             = var.postgresql_storage_mb != null ? var.postgresql_storage_mb : 65536

  lifecycle {
    ignore_changes = [zone]
  }
}
