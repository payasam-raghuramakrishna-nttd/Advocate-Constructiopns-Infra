output "resource_group_id" {
  value = azurerm_resource_group.main.id
}

output "resource_group_name" {
  value = azurerm_resource_group.main.name
}

output "vnet_name" {
  value = module.vnet.vnet_name
}

output "subnet_ids" {
  value = module.subnet.subnet_ids
}

output "app_service_plan_id" {
  value = module.app_service_plan.service_plan_id
}

output "webapp_id" {
  value = module.webapp.webapp_id
}

output "postgresql_id" {
  value = module.postgresql.postgresql_id
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}

output "keyvault_id" {
  value = module.keyvault.keyvault_id
}

output "log_analytics_workspace_id" {
  value = module.log_analytics.workspace_id
}

output "waf_policy_id" {
  value = module.waf_policy.waf_policy_id
}

output "application_gateway_id" {
  value = module.application_gateway.application_gateway_id
}

output "application_gateway_public_ip" {
  value = module.application_gateway.application_gateway_public_ip
}
