
resource_group_name = "rg-dev-enterprise-001"
location            = "Central US"
tenant_id           = "a86685eb-6afd-4b6d-b3c9-3849a3360675"

vnet_name           = "vnet-dev-enterprise-001"
address_space       = ["10.10.0.0/16"]

subnets = {
  agw-subnet = ["10.10.0.0/24"]
  web-subnet = ["10.10.1.0/24"]
  app-subnet = ["10.10.2.0/24"]
  db-subnet  = ["10.10.3.0/24"]
}

asp_name            = "asp-dev-enterprise-001"
asp_sku             = "S1"
asp_os_type         = "Linux"

webapp_name         = "webapp-adv-dev-cus-infra"

postgresql_server_name      = "psql-adv-dev-cus-infra"
postgresql_admin_username   = "pgadmin"
postgresql_admin_password   = "ChangeMe123!"
postgresql_sku              = "B_Standard_B2s"
postgresql_storage_mb       = 65536

storage_account_name = "stadvodevcusinfra"

keyvault_name = "kv-adv-dev-cus-infra"

log_analytics_workspace_name = "law-dev-enterprise-001"

application_gateway_name           = "agw-dev-enterprise-001"
application_gateway_public_ip_name = "pip-dev-agw-001"

waf_policy_name = "waf-dev-enterprise-001"
