
resource_group_name = "rg-prod-enterprise-001"
location            = "Central US"
tenant_id           = "a86685eb-6afd-4b6d-b3c9-3849a3360675"

vnet_name           = "vnet-prod-enterprise-001"
address_space       = ["10.20.0.0/16"]

subnets = {
  agw-subnet = ["10.20.0.0/24"]
  web-subnet = ["10.20.1.0/24"]
  app-subnet = ["10.20.2.0/24"]
  db-subnet  = ["10.20.3.0/24"]
}

asp_name            = "asp-prod-enterprise-001"
asp_sku             = "S1"
asp_os_type         = "Linux"

webapp_name         = "webapp-adv-prd-cus-infra"

postgresql_server_name      = "psql-adv-prd-cus-infra"
postgresql_admin_username   = "pgadmin"
postgresql_admin_password   = "ChangeMe123!"
postgresql_sku              = "GP_Standard_D2s_v3"
postgresql_storage_mb       = 131072

storage_account_name = "stadvoprdcusinfra"

keyvault_name = "kv-adv-prd-cus-infra"

log_analytics_workspace_name = "law-prod-enterprise-001"

application_gateway_name           = "agw-prod-enterprise-001"
application_gateway_public_ip_name = "pip-prod-agw-001"

waf_policy_name = "waf-prod-enterprise-001"
