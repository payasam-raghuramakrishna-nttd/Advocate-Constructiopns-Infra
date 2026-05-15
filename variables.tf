
variable "resource_group_name" {}
variable "location" {}
variable "tenant_id" {}

variable "vnet_name" {}
variable "address_space" {}

variable "subnets" {
  type = map(list(string))
}

variable "asp_name" {}
variable "asp_sku" {}
variable "asp_os_type" {}

variable "webapp_name" {}

variable "postgresql_server_name" {}
variable "postgresql_admin_username" {}
variable "postgresql_admin_password" {}
variable "postgresql_sku" {
  default = null
}
variable "postgresql_storage_mb" {
  default = null
}

variable "storage_account_name" {}

variable "keyvault_name" {}

variable "log_analytics_workspace_name" {}

variable "application_gateway_name" {}
variable "application_gateway_public_ip_name" {}
variable "waf_policy_name" {}
