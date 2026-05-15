
variable "resource_group_name" {}
variable "location" {}
variable "server_name" {}
variable "admin_username" {}
variable "admin_password" {}
variable "postgresql_sku" {
  default = null
}
variable "postgresql_storage_mb" {
  default = null
}
