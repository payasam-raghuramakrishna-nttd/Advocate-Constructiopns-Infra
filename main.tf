
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

module "vnet" {
  source              = "./modules/vnet"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  vnet_name           = var.vnet_name
  address_space       = var.address_space
}

module "subnet" {
  source               = "./modules/subnet"
  resource_group_name  = azurerm_resource_group.main.name
  virtual_network_name = module.vnet.vnet_name
  subnets              = var.subnets
}

module "app_service_plan" {
  source              = "./modules/app_service_plan"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  asp_name            = var.asp_name
  sku_name            = var.asp_sku
  os_type             = var.asp_os_type
}

module "webapp" {
  source              = "./modules/webapp"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  webapp_name         = var.webapp_name
  service_plan_id     = module.app_service_plan.service_plan_id
}

module "postgresql" {
  source              = "./modules/postgresql"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  server_name         = var.postgresql_server_name
  admin_username      = var.postgresql_admin_username
  admin_password      = var.postgresql_admin_password
  postgresql_sku      = var.postgresql_sku
  postgresql_storage_mb = var.postgresql_storage_mb
}

module "storage_account" {
  source               = "./modules/storage_account"
  resource_group_name  = azurerm_resource_group.main.name
  location             = azurerm_resource_group.main.location
  storage_account_name = var.storage_account_name
}

module "keyvault" {
  source              = "./modules/keyvault"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  keyvault_name       = var.keyvault_name
  tenant_id           = var.tenant_id
}

module "log_analytics" {
  source              = "./modules/log_analytics"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  workspace_name      = var.log_analytics_workspace_name
}

module "waf_policy" {
  source              = "./modules/waf_policy"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  waf_policy_name     = var.waf_policy_name
}

module "application_gateway" {
  source                     = "./modules/application_gateway"
  resource_group_name        = azurerm_resource_group.main.name
  location                   = azurerm_resource_group.main.location
  application_gateway_name   = var.application_gateway_name
  public_ip_name             = var.application_gateway_public_ip_name
  subnet_id                  = module.subnet.subnet_ids[0]
  waf_policy_id              = module.waf_policy.waf_policy_id
}
